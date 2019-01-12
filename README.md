# docker-fddf

A lightweight Docker image for [`birkenfeld/fddf`](https://github.com/birkenfeld/fddf), a fast data dupe finder.

```
docker pull mrsaints/fddf
docker run --rm -v $(pwd):/target/:ro mrsaints/fddf fddf -v -t .
```

_Mount the files / directories you want to check to `/target/`, and optionally set `:ro` for extra safety._
