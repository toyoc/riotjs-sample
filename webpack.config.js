const webpack = require('webpack')
const path = require('path')
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')

module.exports = {
  context: path.resolve(__dirname, './src/js'),
  entry: {
    index: './index.js'
  },
  output: {
    path: path.join(__dirname, 'dist/js/'),
    filename: '[name].js'
  },
  module: {
    rules: [{
      test: /\.tag$/,
      enforce: 'pre',
      exclude: /nodemodules/,
      loader: 'tag-pug-loader'
    },{
      test: /\.js|\.tag$/,
      enforce: 'post',
      exclude: /node_modules/,
      use: {
        loader: 'babel-loader',
        query: {
          presets: ['es2015-riot']
        }
      }
    }]
  },
  resolve: {
    extensions: ['js', '.tag']
  },
  optimization: {
    minimizer: [
      new UglifyJsPlugin({
        uglifyOptions: {
          compress: {
            warnings: false
          },
          mangle: true
        }
      })
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify('production')
      }
    })
  ]
}
