FROM registry.access.redhat.com/ubi8/ubi:8.1
RUN yum install sudo -y
RUN sudo yum install wget zip -y
RUN cd /tmp && \
terraform_version='0.13.0' && \
sudo curl -o bin_terraform.zip https://releases.hashicorp.com/terraform/"$terraform_version"/terraform_"$terraform_version"_linux_amd64.zip && \
sudo unzip -o bin_terraform.zip && \
sudo mv terraform /usr/bin && \
sudo rm -rf bin_terraform.zip
RUN sudo terraform version
RUN packer_version='1.6.1' && \
curl -o bin_packer.zip https://releases.hashicorp.com/packer/"$packer_version"/packer_"$packer_version"_linux_amd64.zip && \
unzip bin_packer.zip && \
sudo mv packer /usr/bin && \
rm -rf bin_packer.zip
RUN packer version
RUN yum install python3 -y
RUN alternatives --set python /usr/bin/python3
RUN python --version
RUN yum -y install python3-pip
##If install for single user
#RUN pip3 install ansible --user
##If install for all user
RUN pip3 install ansible
RUN yum install make -y
