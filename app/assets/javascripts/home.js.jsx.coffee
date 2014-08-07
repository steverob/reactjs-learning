# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###* @jsx React.DOM ###

TitleComponent = React.createClass
  render: ->
    `<h1>Hello World from React! :) </h1>`

TimeComponent = React.createClass
  render: ->
    `<div className="well">
      Hi there! <input className="input" name="text" placeholder="Enter some text" />
      <p>{this.props.time.toTimeString()}</p>
    </div>`


$ ->
  React.renderComponent `<TitleComponent />`, document.getElementById('react-title')

  setInterval ->
    React.renderComponent `<TimeComponent time={new Date()} />`, document.getElementById('react-time')
  , 500