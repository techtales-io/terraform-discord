locals {
  path = "assets"
  assets = {
    for file in fileset("${path.root}/../${local.path}", "*.png") :
    "${local.path}/${file}" => "data:image/png;base64,${filebase64("${path.root}/../${local.path}/${file}")}"
  }
}
