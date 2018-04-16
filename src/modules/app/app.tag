app
  span どのJSフレームワークを使いますか？
  button-group
    .result(if="{ parent.winner }")
      img(src="{ parent.winner.image }" height="80")
      .name { parent.winner.name }
      
    vote-button(
      each="{ buttonAttr in parent.buttonAttrs }"
      image="{ buttonAttr.image }" height="{ buttonAttr.height }" count="{ buttonAttr.count }" trigger="{ buttonAttr.trigger }" observable="{ parent.parent.observable }") { buttonAttr.name }

  script.
    const riot = require('riot')
    this.observable = riot.observable()
    this.riotCount = 4
    this.vuejsCount = 0
    this.emberCount = 0
    this.reactCount = -1
    this.winner = false
    this.images = {
      riot: "http://riotjs.com/img/logo/riot240x.png",
      vuejs: "https://vuejs.org/images/logo.png",
      ember: "https://emberjs.com/images/brand/ember_Ember-Light-e42a2b30.png",
      react: "https://pbs.twimg.com/profile_images/446356636710363136/OYIaJ1KK_400x400.png"
    }
    this.buttonAttrs = [
      { image:this.images.riot, height:"40", count: this.riotCount, name: "Riot", trigger: 'votedForRiot' },
      { image:this.images.vuejs, height:"40", count: this.vueCount, name: "Vue.js", trigger: 'votedForVuejs' },
      { image:this.images.ember, height:"40", count: this.emberCount, name: "ember", trigger: 'votedForEmber' },
      { image:this.images.react, height:"40", count: this.reactCount, name: "react", trigger: 'votedForReact' }
    ]
    this.observable.on('votedForRiot', (count) => {
      this.riotCount = count
      updateResult()
      this.update()
    })
    this.observable.on('votedForVuejs', (count) => {
      this.vuejsCount = count
      updateResult()
      this.update()
    })
    this.observable.on('votedForEmber', (count) => {
      this.emberCount = count
      updateResult()
      this.update()
    })
    this.observable.on('votedForReact', (count) => {
      this.reactCount = count
      updateResult()
      this.update()
    })
    var updateResult = () => {
      var maxCount = Math.max(this.riotCount, this.vuejsCount, this.emberCount, this.reactCount)
      switch (maxCount) {
        case this.riotCount:
          this.winner = { image: this.images.riot, name: "Riot" }
          break;
        case this.vuejsCount:
          this.winner = { image: this.images.vuejs, name: "Vue.js" }
          break;
        case this.emberCount:
          this.winner = { image: this.images.ember, name: "ember" }
          break;
        case this.reactCount:
          this.winner = { image: this.images.react, name: "react" }
          break
      }
    }
    updateResult()
