# Run a docker image

```bash
docker run -d -p 5678:5678 jhackjp/tsv-to-csv-converter-sinatra:v0.1.0
docker run -d -p 5678:5678 --restart=unless-stopped jhackjp/tsv-to-csv-converter-sinatra:v0.1.0
```

# Build a docker image (for developer)

```bash
docker build -t jhackjp/tsv-to-csv-converter-sinatra:v0.1.0 .
```