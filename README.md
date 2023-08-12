# over

GitHub Action for utility called [over](https://github.com/opa-oz/over/tree/main)

For version-tracking you need to have `.over.yaml` file with your package description.
Example:
```yaml
package:
  name: My-awesome package
  version: v1.0.4
  files: [ ]
```

You can get version of your package via this GA:
```yaml
jobs:
  release:
    runs-on: amd64
    steps:
      - uses: actions/checkout@v3
      - name: Get current version
        uses: yakubique/over@v0.0.3
      - name: Check
        run: |
          echo "=> ${{ env.PACKAGE_VERSION }}" # <== PACKAGE_VERSION was added by over-action
```

If you are using mono-repository approach, you can specify each package individually:
```yaml
jobs:
  release:
    runs-on: amd64
    steps:
      - uses: actions/checkout@v3
      - name: Get current version of package-1
        uses: yakubique/over@v0.0.3
        with:
          target: ./package-1/.over.yaml
      - name: Check
        run: |
          echo "=> ${{ env.PACKAGE_VERSION }}"
      - name: Get current version of package-2
        uses: yakubique/over@v0.0.3
        with:
          target: ./package-2/.over.yaml
      - name: Check
        run: |
          echo "=> ${{ env.PACKAGE_VERSION }}"
```