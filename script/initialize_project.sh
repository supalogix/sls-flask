#!/bin/bash -e

# read -p "What is the name of your app? (lowercase): " name
name=`basename $PWD`

if [[ -z "$name" ]]; then exit 1; fi

subst="perl -i -pe s/TEMPLATE/$name/g"

# replace TEMPLATE in files
find TEMPLATE -type f -exec $subst {} \;
$subst serverless.yml package.json app.py tox.ini README.md .travis.yml

mv TEMPLATE $name
echo ""
echo "Project $name ready!"
echo ""
echo "Next steps:"
echo "  pipenv shell"
echo "  flask run --reload"
echo ""
echo "To deploy:"
echo "  sls deploy"