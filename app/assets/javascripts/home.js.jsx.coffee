# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###* @jsx React.DOM ###

Component = React.createClass
  render: ->
    `<h1>Hello World from React! :) </h1>`

$ ->
  React.renderComponent(`<Component />`, document.getElementById 'react-output')