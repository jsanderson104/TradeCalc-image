<h1> This repo is for using Jenkins to build me a custom nginx container image.</h1>

The steps involve the following:
- Use my Jenkins repo README to make your own Jenkins server
- Optionally, configure NGINX on the Jenkins server to proxy web traffic to make the SSL traffic handling and browsing easier.
- Register jenkins server in DNS and join it IDM domain
- Spin-up a VM Jenkins worker node that has podman installed and is also joined to the IDM domain so we can login as podman-builder account. If you don't have IDM just use local accounts and set the SSH keys up
  Notes for building the jenkins worker node vm on redhat are in a separate README file in my Jenkins repo.
- Once the worker node is built and you've got the node created in jenkins. It should be showing as connected in the jenkins node list by now.
- Setup 2 jobs in jenkins
  1st job = runs the "podman_build_image.bash"  which builds the Containerfile and tags/pushes it to docker.io
  2nd job = runs the "redeploy-image.bash" which purges the old container and images, pulls latest copy from docker.io and runs it.

  Right now the container dies when Jenkins user session logs out... Lingering doesn't appear to be working for some reason (will look into it later if i care) but if you SSH to the builder vm (ocibuilder.lab.x.x) and podman start test the container will reflect the latest code change in githubs index.html file
