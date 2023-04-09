// write interation test with terratest here
// the test should run a plan on the current module and check for errors

package test

import (
	"testing"

	"github.com/Azure/azure-kusto-go/kusto"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"google.golang.org/genproto/googleapis/bigtable/admin/cluster/v1"
)

func CheckAdxClusterHealth(cluster_uri string) (bool, error) {
	// TODO: check function with new test run - need to disable cluster destroy
	// Create function to connect to Azure Data Explorer and check if the cluster is created
	endpoint := "https://adxclusterdemo.westeurope.kusto.windows.net"
	kustoConnectionStringBuilder := kusto.NewConnectionStringBuilder(endpoint)
	kustoConnectionString := kustoConnectionStringBuilder.WithDefaultAzureCredential()
	client, err := kusto.New(kustoConnectionString)
	if err != nil {
		panic("Cloud not connect to Azure Data Explorer")
	}
	// Be sure to close the client when you're done. (Error handling omitted for brevity.)
	defer client.Close()

}

func DatabaseExists(client *kusto.Client, databaseName string) (bool, error) {
	// TODO: check function with new test run - need to disable cluster destroy
	query := kusto.NewQuery("show databases")
	res, err := client.Execute(context.Background(), query)
	if err != nil {
		return false, err
	}

	var databases []string
	err = res.ReadStructs(&databases)
	if err != nil {
		return false, err
	}

	for _, database := range databases {
		if database == databaseName {
			return true, nil
		}
	}

	return false, nil
}

func TestTerrafromAdxModule(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "cluster_uri")
	assert.Contains(t, output, "adxclusterdemo")
}
