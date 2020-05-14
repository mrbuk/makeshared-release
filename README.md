# makeshared-release

This BOSH release has one job `makeshared` that run the following command via its `pre-start` script

```
mount --make-rshared /
```

**This is a community project. There is no support from VMware/Pivotal
(e.g. when used as part of PKS/TGKi installaion)**

## Install as a bosh addon (runtime config)

To install the `makeshared` job as a bosh add-on run the following

```
# target the environment you want to install this

# upload the release to the bosh director from github.
# alternatively download this tarball first and upload from local filesystem
bosh upload-release https://github.com/mrbuk/makeshared-release/releases/download/1/makeshared-release-v1.tgz

# install the makeshared job on worker nodes via runtime-config
bosh update-config --type runtime --name makeshared manifest/addon.yml
```

The worker nodes are identified in the `addon.yml` as VMs with the job `kubelet` running on them.

## Apply Changes to K8s Cluster

After this you can update either all cluster (via the upgrade-all-clusters errand) or specific one using `pks update-cluster`
