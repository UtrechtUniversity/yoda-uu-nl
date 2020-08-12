#!/bin/sh
#
# Install script voor yoda.uu.nl Jekyll VM

set -e

sudo apt update
sudo apt install -y ruby ruby-dev make gcc g++ zlib1g-dev

# Workaround for bundler dependency issue described on
# https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html
sudo gem update --system

sudo gem install bundler

cd yoda-uu-nl
bundle install

cat << EOF >> /usr/bin/serve-jekyll
#!/bin/sh
cd yoda-uu-nl
jekyll serve --force_polling
EOF

chmod +x /usr/bin/serve-jekyll

echo "The Jekyll install script has completed."
