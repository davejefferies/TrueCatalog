{{/* Initialiaze values of the chart */}}
{{- define "tc.v1.common.loader.init" -}}

  {{/* Merge chart values and the common chart defaults */}}
  {{- include "tc.v1.common.values.init" . -}}

  {{/* Parse lists and append to values */}}
  {{- include "tc.v1.common.loader.lists" . -}}

  {{/* Ensure TrueCharts chart context information is available */}}
  {{- include "tc.v1.common.lib.util.chartcontext" . -}}

  {{/* Add manifest manager pre-install and pre-update job */}}
  {{- include "tc.v1.common.lib.util.manifest.manage" . | nindent 0 -}}

  {{/* Autogenerate postgresql passwords if needed */}}
  {{- include "tc.v1.common.spawner.cnpg" . }}

  {{/* Autogenerate redis passwords if needed */}}
  {{- include "tc.v1.common.dependencies.redis.injector" . }}

  {{/* Autogenerate mariadb passwords if needed */}}
  {{- include "tc.v1.common.dependencies.mariadb.injector" . }}

  {{/* Autogenerate mongodb passwords if needed */}}
  {{- include "tc.v1.common.dependencies.mongodb.injector" . }}

  {{/* Autogenerate clickhouse passwords if needed */}}
  {{- include "tc.v1.common.dependencies.clickhouse.injector" . }}

  {{/* Autogenerate solr passwords if needed */}}
  {{- include "tc.v1.common.dependencies.solr.injector" . }}

  {{/* Append database wait containers to pods */}}
  {{- include "tc.v1.common.lib.deps.wait" $ }}

{{- end -}}
