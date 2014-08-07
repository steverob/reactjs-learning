# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###* @jsx React.DOM ###

CommentItem = React.createClass
  render: ->
    `<div className="comment">{this.props.comment}</div>`

CommentsList = React.createClass
  render: ->
    commentNodes = @.props.comments.map (comment, index) ->
      `<CommentItem comment={comment.comment} key={comment.id} />`

    `<div className="comments-list">{commentNodes}</div>`

CommentsComponent = React.createClass
  getInitialState: ->
    comments: []

  componentDidMount: ->
    @.loadCommentsFromServer()

  loadCommentsFromServer: ->
    $.ajax
      type: "GET" 
      url: @.props.url
      dataType: 'json'
      success: (comments) =>
        @.setState({comments: comments})

  render: ->
    `<div>
      <h3>Comments</h3>
      <CommentsList comments={this.state.comments} />
    </div>`


$ ->
  comments = [
    {comment: "hello world!", id: 1},
    {comment: "hello world222!", id: 2},
    {comment: "hello world111!", id: 3}
  ]

  React.renderComponent `<CommentsComponent url="/comments.json" />`, document.getElementById('react-comments')