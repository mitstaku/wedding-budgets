# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "chart.js", to: "chart.js/dist/chart.min.js"
pin "total_cost", to: "total_cost.js"
pin "charts.js", to: "charts.js"
pin "turbo", to: "turbo.min.js", preload: true