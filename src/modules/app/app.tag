app
  span どのJSフレームワークを使いますか？
  button-group
    vote-button(
      each="{ buttonAttr in parent.buttonAttrs }"
      image="{ buttonAttr.image }" height="{ buttonAttr.height }" count="{ buttonAttr.count }") { buttonAttr.name }

  script.
    this.buttonAttrs = [
      { image:"http://riotjs.com/img/logo/riot240x.png", height:"40", count: "400", name: "Riot" },
      { image:"https://vuejs.org/images/logo.png", height:"40", name: "Vue.js" },
      { image:"https://emberjs.com/images/brand/ember_Ember-Light-e42a2b30.png", height:"40", count: "0", name: "ember" },
      { image:"https://pbs.twimg.com/profile_images/446356636710363136/OYIaJ1KK_400x400.png", height:"40", count: "-1", name: "react" }
    ]
