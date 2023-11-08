#!/usr/bin/python3

from datadog_api_client import ApiClient, Configuration
from datadog_api_client.v1.api.hosts_api import HostsApi
from datadog_api_client.v1.api.dashboards_api import DashboardsApi

configuration = Configuration()
with ApiClient(configuration) as api_client:
    api_instance = HostsApi(api_client)
    response = api_instance.list_hosts(
            filter="env:ci",
            )

    print(response)

print("dashboards")

configuration = Configuration()
with ApiClient(configuration) as api_client:
    api_instance = DashboardsApi(api_client)
    response = api_instance.list_dashboards(
            filter_shared=False,
            )
    print(response)
