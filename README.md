# Run a docker image

```bash
docker run -d -p 5678:5678 j-hack/tsv-to-csv-converter-sinatra
```

# Build a docker image (for developer)

```bash
docker build -t j-hack/tsv-to-csv-converter-sinatra:v0.1.0 .
```