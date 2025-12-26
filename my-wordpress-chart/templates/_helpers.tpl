{{/*
Expand the name of the chart.
*/}}
{{- define "my-wordpress-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "my-wordpress-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
MySQL fullname
*/}}
{{- define "my-wordpress-chart.mysql.fullname" -}}
{{- printf "%s-mysql" (include "my-wordpress-chart.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
WordPress fullname
*/}}
{{- define "my-wordpress-chart.wordpress.fullname" -}}
{{- printf "%s-wordpress" (include "my-wordpress-chart.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "my-wordpress-chart.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "my-wordpress-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
MySQL selector labels
*/}}
{{- define "my-wordpress-chart.mysql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "my-wordpress-chart.name" . }}-mysql
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: database
{{- end }}

{{/*
WordPress selector labels
*/}}
{{- define "my-wordpress-chart.wordpress.selectorLabels" -}}
app.kubernetes.io/name: {{ include "my-wordpress-chart.name" . }}-wordpress
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: application
{{- end }}
