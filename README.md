# Add as subtree:
```
git remote add template git@github.com:moricetamol/typst-summary-template.git
git subtree add --prefix=template template main --squash
git commit -m "Add template as subtree"

```

# Update subtree:
```
git subtree pull --prefix=template template main --squash
git commit -m "Update template"

```
