# asuswrt-frp
frp for AsusWRT

## Requirement

An ASUS router with standard firmware (no flushing required) and **a USB port**. This script assumes the router has an ARM cpu, which should be common in modern high-end routers.

## Usage

0. Install `ipkg` on your ASUS router by inserting a USB disk and installing the `Download Master` APP from the admin webpage. You can remove that app if you don't need it.
1. Modify the version of frp in `release/make_release.sh` to the latest version.
2. Run `release/make_release.sh` to generate the release package. If error occurs, you may need to fix it yourself.
3. The package will be generated in the `release/packages` directory.
4. Upload the package to the router (via ssh and wget) and install it with `ipkg install frp_<Your package name>.ipk`.
5. Modify the configuration file `/opt/etc/frp/frpc.toml` according to your needs.