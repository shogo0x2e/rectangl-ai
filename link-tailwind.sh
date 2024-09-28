FEATURE_NAME="debug-with-ai"

BUILD_DIR="./build/chrome-mv3-dev"

html_path=$(ls ${BUILD_DIR}/${FEATURE_NAME}.*.html | head -n 1)

css_path=$(ls ${BUILD_DIR}/${FEATURE_NAME}.*.css | head -n 1)

css_file=$(basename "$css_path")

# wait for the file to be created
sleep 3


if ! grep -q "<link rel=\"stylesheet\"" "$html_path"; then
  sed -i '' 's|</head>|  <link rel="stylesheet" href="/'"$css_file"'"></head>|' "$html_path"
  echo "Added link to $css_file in $html_path"
fi

fswatch -o --event Updated "$html_path" | while read; do
  if ! grep -q "<link rel=\"stylesheet\"" "$html_path"; then
    sed -i '' 's|</head>|  <link rel="stylesheet" href="/'"$css_file"'"></head>|' "$html_path"
    echo "Added link to $css_file in $html_path"
  fi
done
