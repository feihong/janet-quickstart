(use joy)

(route :get "/" :hello)

(defn hello [request]
  [:div
    [:h1 "Hello from Janet!"]
    [:p "你好世界！"]])

(defn layout [{:body body :request request}]
  (text/html
    (doctype :html5)
    [:html {:lang "en"}
     [:head
      [:title "Hello from Janet"]
      [:meta {:charset "utf-8"}]
      [:meta {:name "viewport" :content "width=device-width, initial-scale=1"}]]
     [:body body]]))

(def app (app {:layout layout}))

(server app 3000)
