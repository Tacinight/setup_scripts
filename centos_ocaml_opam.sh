wget https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh
sudo bash install.sh
sudo yum install -y patch bubblewrap
opam init
opam install -y merlin utop
