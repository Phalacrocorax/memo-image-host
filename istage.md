<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>__README.md</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
<ul>
<li><a href="#istage">istage</a>
<ul>
<li><a href="#developer-guide">Developer Guide</a></li>
<li><a href="#responsible">responsible</a></li>
</ul>
</li>
</ul>

    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <h1 id="istage">istage</h1>
<ul>
<li>
<p>workspace: <code>GoogleDrive/_docs/_sidepj/istage</code></p>
</li>
<li>
<p>repo: <a href="https://github.com/Phalacrocorax/istage">Phalacrocorax/istage</a></p>
</li>
<li>
<p><a href="https://docs.google.com/spreadsheets/d/1uMSBw9yOw7fSp302h6ER5PJo19cOFrDc-ewm7LhFeZU/edit#gid=1155518991">【Specifications】istage </a></p>
</li>
</ul>
<h2 id="developer-guide">Developer Guide</h2>
<ul>
<li>base-stack: <code>deno-postgres</code> &amp; <code>plain-vue</code></li>
</ul>
<h3 id="api">API</h3>
<ul>
<li>refer <code>/stack/deno/README.md</code></li>
</ul>
<ol>
<li>API Interface： <strong>Rest Client</strong> <code>restapi.http</code></li>
<li>Model：<code>controller/{model}.ts</code></li>
<li>CRUD：替换<code>{model}.ts</code> {Models}→{News}　{Model}→{New}　{models→{new}</li>
<li>添加类型：<code>type.ts</code>，导入model：<code>server.ts</code>，添加路由：<code>routes.ts</code></li>
</ol>
<h4 id="init-database">Init Database</h4>
<pre class=" language-sh"><code class="prism  language-sh"># initDB
pushd ~/GoogleDrive/__docs/_sidepj/istage/api/db &amp;&amp; source ./tool.sh &amp;&amp; initDB
</code></pre>
<h4 id="run-dev-server">Run Dev Server</h4>
<pre class=" language-sh"><code class="prism  language-sh"># api
pushd ~/GoogleDrive/__docs/_sidepj/istage/api &amp;&amp; denon start
## test api
code -r ~/GoogleDrive/__docs/_sidepj/istage/api/restful_api.http
# web
code -r ~/GoogleDrive/__docs/_sidepj/istage/web/index.html
cmd+L,cmd+O
</code></pre>
<h3 id="frontend">Frontend</h3>
<ul>
<li>refer <code>/stack/plain-vue/README.md</code></li>
</ul>
<p><a href="https://github.com/videojs/http-streaming">videojs/http-streaming</a><br>
<a href="http://videojs.com/">videojs.com</a></p>
<ul>
<li><code>videojs-http-streaming.js</code> 1.13.3</li>
<li><code>video.js</code> 7.8.4</li>
<li><code>video.js.css</code> 7.8.4</li>
</ul>
<blockquote>
<p>2020.09.15 注意：video.js的渲染比官网demo等多了一层所以css错位了…这里手动进行调整</p>
</blockquote>
<pre class=" language-html"><code class="prism  language-html"><span class="token comment">&lt;!-- video start --&gt;</span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>div</span> <span class="token attr-name">class</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>video-js<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>
   <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>video</span> <span class="token attr-name">ref</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>videoPlayer<span class="token punctuation">"</span></span> <span class="token attr-name">class</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>vjs-default-skin<span class="token punctuation">"</span></span>  <span class="token attr-name">height</span><span class="token attr-value"><span class="token punctuation">=</span>431</span> <span class="token attr-name">controls</span> <span class="token attr-name">preload</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>auto<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>source</span> <span class="token attr-name">src</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>http://vod.okadanana-mint.com/0e3bd2180a2849ba95674a8eecf390e8/a0ffeb2548c845c4f3542a784af252df-sd.m3u8<span class="token punctuation">"</span></span> <span class="token attr-name">type</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>application/x-mpegURL<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>video</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>div</span><span class="token punctuation">&gt;</span></span>
<span class="token comment">&lt;!-- video end --&gt;</span>

mounted() {
	this.player = videojs(this.$refs.videoPlayer, this.options, function onPlayerReady() {
		console.log('onPlayerReady', this);
	  })
},
</code></pre>
<h2 id="responsible">responsible</h2>
<ul>
<li>toolbar.vue.js</li>
</ul>
<pre class=" language-html"><code class="prism  language-html"><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>div</span> <span class="token attr-name">class</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>ui pointing secondary menu<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>
  <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>router-link</span> <span class="token attr-name">v-for</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>item in items<span class="token punctuation">"</span></span> 
  <span class="token attr-name">:key</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>item.path<span class="token punctuation">"</span></span> 
  <span class="token attr-name">:to</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>item.path<span class="token punctuation">"</span></span> 
  <span class="token attr-name">:class</span><span class="token attr-value"><span class="token punctuation">=</span><span class="token punctuation">"</span>$route.path==item.path? <span class="token punctuation">'</span>active item<span class="token punctuation">'</span> :<span class="token punctuation">'</span>item<span class="token punctuation">'</span><span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>
  {{ item.title }}
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>router-link</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>div</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<ul>
<li><a href="https://codepen.io/Anteater/pen/zYqLKGe">Responsive Video.js Example (v7.8.4) @codepen</a></li>
</ul>

    </div>
  </div>
</body>

</html>
