{{/* Define the secrets */}}
{{- define "lldap.secrets" -}}
{{- $basename := include "tc.v1.common.lib.chart.names.fullname" $ -}}
{{- $fetchname := printf "%s-secret" $basename -}}

{{/* Initialize all keys */}}
{{- $secrets := randAlphaNum 50 }}