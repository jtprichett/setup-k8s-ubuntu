# setup-k8s-ubuntu

This repository was created to support setting up a Kubernetes cluster using Kubeadm with Ubuntu for Apple M1 Pro based chips leveraging Vagrant and VMware Fusion to practice for the Certified Kubernetes Administrator (CKA) test.

Requirements
- [Install Vagrant and VMware Fusion for Apple M1](https://github.com/jtprichett/setup-vagrant-apple-m1)
- [Setup Vagrant for the Udemy Certified Kubernetes Administrator Course](https://github.com/jtprichett/certified-kubernetes-administrator-course)

Checkout and run ./install.sh

## Notes

- Reminder: Use Flannel or another network plug-in as Weave has issues when deploying into Apple Arch
