# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js"
pin "axios", to: "https://unpkg.com/axios@1.6.0/dist/esm/axios.js"
pin "modules/comment", to: "modules/comment.js"
pin "modules/like", to: "modules/like.js"
pin "modules/follow", to: "modules/follow.js"
pin "modules/post", to: "modules/post.js"
