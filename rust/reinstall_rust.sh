
ARCH=i686
#ARCH=x86_64

install_beta(){
rm -vrf ~/opt/rust-beta && mkdir ~/opt/rust-beta && curl -sL https://static.rust-lang.org/dist/rust-beta-$ARCH-unknown-linux-gnu.tar.gz | tar --strip-components=1 -C ~/opt/rust-beta -xzf - 
}
install_nightly(){
rm -vrf ~/opt/rust-nightly && mkdir ~/opt/rust-nightly && curl -sL https://static.rust-lang.org/dist/rust-nightly-$ARCH-unknown-linux-gnu.tar.gz | tar --strip-components=1 -C ~/opt/rust-nightly -xzf - 
}

#install_beta
#install_nightly

cat << EOF
Remember to set PATH and LD_LIBRARY_PATH in your RC file.
Example for multi-version install
# RUST
if [ -z "$RUST_NIGHTLY" ] ; then
  export PATH="$PATH:/home/vini/opt/rust/rustc/bin:/home/vini/opt/rust/cargo/bin"
  export LD_LIBRARY_PATH="/home/vini/opt/rust/rustc/lib:/home/vini/opt/rust/rustc/lib/rustlib/x86_64-unknown-linux-gnu/lib"
else
  export PATH="/home/vini/opt/rust-nightly/rustc/bin:/home/vini/opt/rust-nightly/cargo/bin:$PATH"
  export LD_LIBRARY_PATH="/home/vini/opt/rust-nightly/rustc/lib:/home/vini/opt/rust-nightly/rustc/lib/rustlib/x86_64-unknown-linux-gnu/lib"
fi
EOF
