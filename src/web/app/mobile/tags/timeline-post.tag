<mk-timeline-post class={ repost: isRepost }>
	<div class="reply-to" if={ p.reply_to }>
		<mk-timeline-post-sub post={ p.reply_to }></mk-timeline-post-sub>
	</div>
	<div class="repost" if={ isRepost }>
		<p><a class="avatar-anchor" href={ CONFIG.url + '/' + post.user.username }><img class="avatar" src={ post.user.avatar_url + '?thumbnail&size=64' } alt="avatar"/></a><i class="fa fa-retweet"></i><a class="name" href={ CONFIG.url + '/' + post.user.username }>{ post.user.name }</a>がRepost</p>
		<mk-time time={ post.created_at }></mk-time>
	</div>
	<article><a class="avatar-anchor" href={ CONFIG.url + '/' + p.user.username }><img class="avatar" src={ p.user.avatar_url + '?thumbnail&size=96' } alt="avatar"/></a>
		<div class="main">
			<header>
				<a class="name" href={ CONFIG.url + '/' + p.user.username }>{ p.user.name }</a>
				<span class="is-bot" if={ p.user.is_bot }>bot</span>
				<span class="username">@{ p.user.username }</span>
				<a class="created-at" href={ url }>
					<mk-time time={ p.created_at }></mk-time>
				</a>
			</header>
			<div class="body">
				<div class="text" ref="text">
					<a class="reply" if={ p.reply_to }>
						<i class="fa fa-reply"></i>
					</a>
					<p class="dummy"></p>
					<a class="quote" if={ p.repost != null }>RP:</a>
				</div>
				<div class="media" if={ p.media }>
					<mk-images-viewer images={ p.media }></mk-images-viewer>
				</div>
				<mk-poll if={ p.poll } post={ p }></mk-poll>
				<span class="app" if={ p.app }>via <b>{ p.app.name }</b></span>
				<div class="repost" if={ p.repost }><i class="fa fa-quote-right fa-flip-horizontal"></i>
					<mk-post-preview class="repost" post={ p.repost }></mk-post-preview>
				</div>
			</div>
			<footer>
				<button onclick={ reply }><i class="fa fa-reply"></i>
					<p class="count" if={ p.replies_count > 0 }>{ p.replies_count }</p>
				</button>
				<button onclick={ repost } title="Repost"><i class="fa fa-retweet"></i>
					<p class="count" if={ p.repost_count > 0 }>{ p.repost_count }</p>
				</button>
				<button class={ liked: p.is_liked } onclick={ like }><i class="fa fa-thumbs-o-up"></i>
					<p class="count" if={ p.likes_count > 0 }>{ p.likes_count }</p>
				</button>
			</footer>
		</div>
	</article>
	<style>
		:scope
			display block
			margin 0
			padding 0
			font-size 12px

			@media (min-width 350px)
				font-size 14px

			@media (min-width 500px)
				font-size 16px

			> .repost
				color #9dbb00
				background linear-gradient(to bottom, #edfde2 0%, #fff 100%)

				> p
					margin 0
					padding 8px 16px
					line-height 28px

					@media (min-width 500px)
						padding 16px

					.avatar-anchor
						display inline-block

						.avatar
							vertical-align bottom
							width 28px
							height 28px
							margin 0 8px 0 0
							border-radius 6px

					i
						margin-right 4px

					.name
						font-weight bold

				> mk-time
					position absolute
					top 8px
					right 16px
					font-size 0.9em
					line-height 28px

					@media (min-width 500px)
						top 16px

				& + article
					padding-top 8px

			> .reply-to
				background rgba(0, 0, 0, 0.0125)

				> mk-post-preview
					background transparent

			> article
				padding 14px 16px 9px 16px

				&:after
					content ""
					display block
					clear both

				> .avatar-anchor
					display block
					float left
					margin 0 10px 8px 0
					position -webkit-sticky
					position sticky
					top 62px

					@media (min-width 500px)
						margin-right 16px

					> .avatar
						display block
						width 48px
						height 48px
						margin 0
						border-radius 6px
						vertical-align bottom

						@media (min-width 500px)
							width 58px
							height 58px
							border-radius 8px

				> .main
					float left
					width calc(100% - 58px)

					@media (min-width 500px)
						width calc(100% - 74px)

					> header
						display flex
						white-space nowrap

						@media (min-width 500px)
							margin-bottom 2px

						> .name
							display block
							margin 0 0.5em 0 0
							padding 0
							overflow hidden
							color #777
							font-size 1em
							font-weight 700
							text-align left
							text-decoration none
							text-overflow ellipsis

							&:hover
								text-decoration underline

						> .is-bot
							text-align left
							margin 0 0.5em 0 0
							padding 1px 6px
							font-size 12px
							color #aaa
							border solid 1px #ddd
							border-radius 3px

						> .username
							text-align left
							margin 0 0.5em 0 0
							color #ccc

						> .created-at
							margin-left auto
							font-size 0.9em
							color #c0c0c0

					> .body

						> .text
							cursor default
							display block
							margin 0
							padding 0
							overflow-wrap break-word
							font-size 1.1em
							color #717171

							> .dummy
								display none

							mk-url-preview
								margin-top 8px

							> .reply
								margin-right 8px
								color #717171

							> .quote
								margin-left 4px
								font-style oblique
								color #a0bf46

							code
								padding 4px 8px
								margin 0 0.5em
								font-size 80%
								color #525252
								background #f8f8f8
								border-radius 2px

							pre > code
								padding 16px
								margin 0

							[data-is-me]:after
								content "you"
								padding 0 4px
								margin-left 4px
								font-size 80%
								color $theme-color-foreground
								background $theme-color
								border-radius 4px

						> .media
							> img
								display block
								max-width 100%

						> .app
							font-size 12px
							color #ccc

						> mk-poll
							font-size 80%

						> .repost
							margin 8px 0

							> i:first-child
								position absolute
								top -8px
								left -8px
								z-index 1
								color #c0dac6
								font-size 28px
								background #fff

							> mk-post-preview
								padding 16px
								border dashed 1px #c0dac6
								border-radius 8px

					> footer
						> button
							margin 0 28px 0 0
							padding 8px
							background transparent
							border none
							box-shadow none
							font-size 1em
							color #ddd
							cursor pointer

							&:hover
								color #666

							> .count
								display inline
								margin 0 0 0 8px
								color #999

							&.liked
								color $theme-color

	</style>
	<script>
		this.mixin('api');
		this.mixin('text');
		this.mixin('get-post-summary');
		this.mixin('open-post-form');

		this.post = this.opts.post
		this.is-repost = this.post.repost? and !this.post.text?
		this.p = if @is-repost then this.post.repost else this.post
		this.summary = @get-post-summary this.p
		this.url = CONFIG.url + '/' + this.p.user.username + '/' + this.p.id

		this.on('mount', () => {
			if this.p.text?
				tokens = if this.p._highlight?
					then @analyze this.p._highlight
					else @analyze this.p.text

				this.refs.text.innerHTML = this.refs.text.innerHTML.replace '<p class="dummy"></p>' if this.p._highlight?
					then @compile tokens, true, false
					else @compile tokens

				this.refs.text.children.forEach (e) =>
					if e.tag-name == 'MK-URL' 
						riot.mount e

				// URLをプレビュー
				tokens
					.filter (t) -> t.type == 'link' 
					.map (t) =>
						this.preview = this.refs.text.appendChild document.createElement 'mk-url-preview' 
						riot.mount this.preview, do
							url: t.content

		this.reply = () => {
			@open-post-form do
				reply: this.p

		this.repost = () => {
			text = window.prompt '「' + @summary + '」をRepost'
			if text?
				this.api 'posts/create' do
					repost_id: this.p.id
					text: if text == '' then undefined else text

		this.like = () => {
			if this.p.is_liked
				this.api 'posts/likes/delete' do
					post_id: this.p.id
				.then =>
					this.p.is_liked = false
					this.update();
			else
				this.api 'posts/likes/create' do
					post_id: this.p.id
				.then =>
					this.p.is_liked = true
					this.update();
	</script>
</mk-timeline-post>
