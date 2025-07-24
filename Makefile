.PHONY: setup update gen localized icon build forqa forqa2 uat release


.PHONY: list
list:
	@echo "Available commands:"
	@echo ""
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {command=$$1; sub(/.*: /, "", command); gsub(/\\n/, "\n\t\t\t\t", $$2); printf "\033[36m%-32s\033[0m %s\n", "make " command, $$2}'
	@echo ""

.PHONY: gen
gen: ## 執行 build_runner，自動產生對應檔案(例如 *.g.dart)
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: get
get: ## Fetch Flutter packages
	fvm flutter pub get

.PHONY: clean
clean: ## Clean Flutter build files and caches
	fvm flutter clean

.PHONY: upgrade
upgrade: ## 升級套件到目前允許的最新版本(不跨主版本)
	fvm flutter pub upgrade