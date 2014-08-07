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

CommentsForm = React.createClass
  onSubmit: ->
    comment = this.refs.comment.getDOMNode().value.trim()
    this.props.onCommentSubmit({comment: comment})
    this.refs.comment.getDOMNode().value = "";
    false

  render: ->
    `<form className="form form-inline" onSubmit={this.onSubmit}>
      <input className="input span8" ref="comment" placeholder="Enter comment" />
      <input type="submit" className="btn btn-primary" />
    </form>`

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

  handleCommentSubmit: (newComment) ->
    this.setState({comments: this.state.comments.concat [newComment]})
    $.ajax
      type: "POST"
      url: @.props.url
      data: {"comment": newComment}
      success: =>
        @.loadCommentsFromServer()


  render: ->
    `<div>
      <h3>Comments</h3>
      <CommentsList comments={this.state.comments} />
      <br />
      <CommentsForm onCommentSubmit={this.handleCommentSubmit}/>
    </div>`


$ ->
  React.renderComponent `<CommentsComponent url="/comments.json" />`, document.getElementById('react-comments')