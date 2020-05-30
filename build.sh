#!/bin/bash

# only proceed script when started not by pull request (PR)
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi

# enable error reporting to the console
set -e

# build site with jekyll, by default to `_site' folder
#jekyll build
echo "#### Step 1: build"
bundle exec jekyll build --trace

# cleanup
echo "#### Step 2: cleanup"
rm -rf ../workdir

#clone `gh-pages' branch of the repository using encrypted GH_TOKEN for authentification
echo "#### Step 3: git clone"
git clone -b gh-pages https://${GH_TOKEN}@github.com/adamatti/blog.git ../workdir

# copy generated HTML site to `gh-pages' branch
echo "#### Step 4: copy"
cp -R _site/* ../workdir

# commit and push generated content to `gh-pages' branch
# since repository was cloned in write mode with token auth - we can push there
cd ../workdir

echo "#### Step 5: Git settings"
git config user.email "adamatti@gmail.com"
git config user.name "Marcelo Adamatti"
git add -A .
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"

echo "#### Step 6: Git push"
git push --quiet origin gh-pages > /dev/null 2>&1
