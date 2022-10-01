String beonTagsToHTML(String str) {
  // String parse = str;

  // Iterable<RegExpMatch> matches =
  //     RegExp(r'/(\\s|^):-\\)(\\s|$)/').allMatches(str);

  // for (var element in matches) {
  //   element.group(1);
  //   parse = parse.replaceAll(element.group(1).toString(),
  //       '<img src="//beon.fun/i/smiles/smile.png">) ');
  // }

  //',$printable_str);

  // RegExp(r'/(\\s|^):-\\((\\s|$)/'),'$1<img src="//beon.fun/i/smiles/sad.png">$2',$printable_str);

  // RegExp(r'/(\\s|^);-\\)(\\s|$)/','$1<img src="//beon.fun/i/smiles/wink.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-\\*(\\s|$)/','$1<img src="//beon.fun/i/smiles/kiss.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-D(\\s|$)/','$1<img src="//beon.fun/i/smiles/big-smile.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-O(\\s|$)/','$1<img src="//beon.fun/i/smiles/surprised.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-P(\\s|$)/','$1<img src="//beon.fun/i/smiles/tongue-sticking-out.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)X-\\((\\s|$)/','$1<img src="//beon.fun/i/smiles/angry.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)]:-\\)(\\s|$)/','$1<img src="//beon.fun/i/smiles/devil.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)O:-\\)(\\s|$)/','$1<img src="//beon.fun/i/smiles/angel.png">$2',$printable_str);

  // RegExp(r"/(\\s|^):'\\((\\s|$)/",'$1<img src="//beon.fun/i/smiles/cry.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-\\[(\\s|$)/','$1<img src="//beon.fun/i/smiles/upset.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-\\\(\\s|$)/','$1<img src="//beon.fun/i/smiles/confused.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-\|(\\s|$)/','$1<img src="//beon.fun/i/smiles/undecided.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-\\?(\\s|$)/','$1<img src="//beon.fun/i/smiles/thinking.png">$2',$printable_str);

  // RegExp(r'/(\\s|^);~\\)(\\s|$)/','$1<img src="//beon.fun/i/smiles/cunning.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)\\(:\\|(\\s|$)/','$1<img src="//beon.fun/i/smiles/tired.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)8-}(\\s|$)/','$1<img src="//beon.fun/i/smiles/crazy.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):-\\$(\\s|$)/','$1<img src="//beon.fun/i/smiles/shhh.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)8-\\|(\\s|$)/','$1<img src="//beon.fun/i/smiles/shocked.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)B-\\)(\\s|$)/','$1<img src="//beon.fun/i/smiles/sun-glasses.png">$2',$printable_str);

  // RegExp(r'/(\\s|^):\\^\\)(\\s|$)/','$1<img src="//beon.fun/i/smiles/turn-red.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)=\\^B(\\s|$)/','$1<img src="//beon.fun/i/smiles/thumbs-up.png">$2',$printable_str);

  // RegExp(r'/(\\s|^)=,B(\\s|$)/','$1<img src="//beon.fun/i/smiles/thumbs-down.png">$2',$printable_str);

  // RegExp(r'/^&gt; (.*)(\\s|$)/m','<p class="quotation">$1</p>', $printable_str);

  // nl2br($printable_str);

  // RegExp(r'/\\[B\\](.*?)\\[\\/B\\]/s','<strong>$1</strong>', $printable_str);

  // RegExp(r'/\\[I\\](.*?)\\[\\/I\\]/s','<i>$1</i>', $printable_str);

  // RegExp(r'/\\[U\\](.*?)\\[\\/U\\]/s','<u>$1</u>', $printable_str);

  // RegExp(r'/\\[S\\](.*?)\\[\\/S\\]/s','<s>$1</s>', $printable_str);

  // RegExp(r'/\\[H\\](.*?)\\[\\/H\\]/s','<span style="font-size: 1.6rem">$1</span>', $printable_str);

  // RegExp(r'/\\[OFF\\](.*?)\\[\\/OFF\\]/s','<span style="font-size: 0.7em">$1</span>', $printable_str);

  // RegExp(r'/\\[CENTER\\](.*?)\\[\\/CENTER\\]/s','<p style="text-align: center">$1</p>', $printable_str);

  // RegExp(r'/\\[RIGHT\\](.*?)\\[\\/RIGHT\\]/s','<p style="text-align: right">$1</p>', $printable_str);

  // RegExp(r'/\\[JUSTIFY\\](.*?)\\[\\/JUSTIFY\\]/s','<p style="text-align: justify">$1</p>', $printable_str);

  // RegExp(r'/<\/p>\\s*<br \/>/s','</p>', $printable_str);

  // if($removeSpoiler){

  // 	RegExp(r'/\\[SPOILER\\](.*?)\\[\\/SPOILER\\]/s','$1', $printable_str);

  // }

  // preg_replace_callback(

  // 	'/\\[img-(original|medium|small)-(none|left|right)-([^\\s\\]]*)?\\]/',

  // 	function($matches){

  // 		$imgSize = 0;

  // 		switch($matches[1]){

  // 			case 'original': $imgSize = 400; break;

  // 			case 'medium': $imgSize = 320; break;

  // 			case 'small': $imgSize = 200; break;

  // 		};

  // 		$imgurl = str_replace('https:','',$matches[3]);

  // 		$imgurl = str_replace('http://i1.beon.fun/','//i1.beon.fun/',$imgurl);

  // 		$imgurl = str_replace('http://i99.beon.fun/','//i99.beon.fun/',$imgurl);

  // 		$imgurl = str_replace('http://','//i99.beon.fun/',$imgurl);

  // 		if(!preg_match('/^\/\/.*/', $imgurl) || preg_match('/\'onerror=/', $imgurl) || preg_match('/\'onload=/', $imgurl)){

  // 			return "<img src='https://beon.fun/i/smiles/smile.png'>";

  // 		}

  // 		if($imgSize == 400){

  // 			return "<span class='imagewrapper' style='display:inline-block;max-width:410px;float:{$matches[2]}' align='{$matches[2]}'><img src='{$imgurl}' style='max-width:100%' align='{$matches[2]}' class='imagefsme'></span>";

  // 		} else {

  // 			return "<img src='{$imgurl}' style='max-width:100%; width:{$imgSize}px;float:{$matches[2]}' align='{$matches[2]}' class='imagefsme'>";

  // 		}

  // 	},

  // 	$printable_str);

  // preg_replace_callback(

  // 	'/\\[stkr-([\d]*)?\\]/',

  // 	function($matches){

  // 		return "<span><img src='//beon.fun/i/stickers/{$matches[1]}.png' style='max-width:100%;'></span>";

  // 	},

  // 	$printable_str);

  // preg_replace_callback(

  // 	'/\\[stkr-vk-([\d]*)?\\]/',

  // 	function($matches){

  // 		return "<img src='//beon.fun/i/vkstickers/{$matches[1]}/128.png'>";

  // 	},

  // 	$printable_str);

  // RegExp(r'/\\[emoji-([0-9A-F]*)\\]/','<img src="//beon.fun/i/emoji/$1.png" alt="emoji">',$printable_str);

  // RegExp(r'/\\[klbk-([a-z0-9_-]*)\\]/','<img src="//beon.fun/i/smiles/kolobok/$1.gif" alt="kolobok-smile">',$printable_str);

  // RegExp(r'/\\[video-youtube-playlist-(.*?)\\]/','<span class="embed-responsive embed-responsive-16by9" style="max-width:600px;display:inline-block;"><iframe width="640" height="360" src="https://www.youtube.com/embed/?listType=playlist&list=$1" allowfullscreen></iframe></span>', $printable_str);

  // RegExp(r'/\\[video-youtube-(.*?)\\]/','<span class="embed-responsive embed-responsive-16by9" style="max-width:600px;display:inline-block;"><iframe width="640" height="360" src="https://www.youtube.com/embed/$1" allowfullscreen></iframe></span>', $printable_str);

  // RegExp(r'/\\[video-vimeo-(.*?)\\]/','<span class="embed-responsive embed-responsive-16by9" style="max-width:600px;display:inline-block;"><iframe src="https://player.vimeo.com/video/$1" width="640" height="390" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe></span>', $printable_str);

  // RegExp(r'/\\[video-rutube-(.*?)\\]/','<span class="embed-responsive embed-responsive-16by9" style="max-width:600px;display:inline-block;"><iframe width="100%" height="100%" src="//rutube.ru/play/embed/$1" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe></span>', $printable_str);

  // RegExp(r'/\\[video-twitch-channel-(.*?)\\]/','<span class="embed-responsive embed-responsive-16by9" style="max-width:600px;display:inline-block;"><iframe

  // src="https://player.twitch.tv/?channel=$1&parent=' . $_SERVER['HTTP_HOST'] . '" height="100%" width="100%" allowfullscreen="true"></iframe></span>', $printable_str);

  // RegExp(r'/\\[video-twitch-clip-(.*?)\\]/','<span class="embed-responsive embed-responsive-16by9" style="max-width:600px;display:inline-block;"><iframe src="https://clips.twitch.tv/embed?clip=$1&parent=' . $_SERVER['HTTP_HOST'] . '" height="100%" width="100%" allowfullscreen="true"></iframe></span>', $printable_str);

  // RegExp(r'/\\[video-twitch-(.*?)\\]/','<span class="embed-responsive embed-responsive-16by9" style="max-width:600px;display:inline-block;"><iframe

  // src="https://player.twitch.tv/?video=$1&parent=' . $_SERVER['HTTP_HOST'] . '" height="100%" width="100%" allowfullscreen="true"></iframe></span>', $printable_str);

  // RegExp(r'/\\[video-tiktok-(.*?)\\]/','<span class="tiktok-container" style="width:98%;max-width:290px;display:inline-block;"><iframe src="https://www.tiktok.com/embed/$1?lang=ru-RU" style="width:100%; display: inline-block; height: 600px;" frameborder="0" scrolling="no"></iframe></span>', $printable_str);

  // RegExp(r'/\\[video-webmsh-(.*?)\\]/','<span class="embed-responsive embed-responsive-16by9" style="max-width:600px;display:inline-block;"><video id="player" style="position: absolute;top: 50%;left: 50%;margin-right: -50%;transform: translate(-50%, -50%);width: 100%; max-width: 720px; max-height: 100%;" controls=""><source src="//s1.webmshare.com/$1.webm" type="video/webm">Your browser does not support the video tag.</video></iframe></span>', $printable_str);

  // RegExp(r'/\\[audio-yt-(.*?)\\]/','<audio class="ytaplayer" controls data-yt2html5="https://www.youtube.com/embed/$1" style="width: 300px;height: 75px;"></audio>', $printable_str);

  // RegExp(r'/\\[audio-soundcloud-track-([0-9]*)?\\]/','<span style="display:inline-block;width: 100%;max-width:600px;"><iframe width="100%" height="166" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/$1&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=false"></iframe></span>', $printable_str);

  // RegExp(r'/\\[audio-soundcloud-playlist-([0-9]*)?\\]/','<span style="display:inline-block;width: 100%;max-width:600px;"><iframe width="60%" height="450" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/$1&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=false"></iframe></span>', $printable_str);

  // RegExp(r'/\\[audio-yamusic-track-([0-9]*)-([0-9]*)?\\]/','<iframe frameborder="0" style="border:none;width:80%;height:180px;" width="80%" height="180" src="https://music.yandex.ru/iframe/#track/$1/$2"></iframe>', $printable_str);

  // RegExp(r'/\\[audio-yamusic-album-([0-9]*)?\\]/','<iframe frameborder="0" style="border:none;width:80%;height:450px;" width="80%" height="450" src="https://music.yandex.ru/iframe/#album/$1"></iframe>', $printable_str);

  // RegExp(r'/\\[audio-spotify-track-(.*)?\\]/','<span style="display:inline-block;width:100%;max-width:600px"><iframe src="https://open.spotify.com/embed/track/$1" width="100%" height="80" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe></span>', $printable_str);

  // RegExp(r'/\\[audio-spotify-album-(.*)?\\]/','<span style="display:inline-block;width:100%;max-width:600px"><iframe src="https://open.spotify.com/embed/album/$1" width="100%" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe></span>', $printable_str);

  // RegExp(r'/\\[audio-spotify-playlist-(.*)?\\]/','<span style="display:inline-block;width:100%;max-width:600px"><iframe src="https://open.spotify.com/embed/playlist/$1" width="100%" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe></span>', $printable_str);

  // RegExp(r'/\\[audio-apple-(\d*)-(\d*)\\]/','<span style="display:inline-block;width:100%;max-width:600px"><iframe allow="autoplay *; encrypted-media *; fullscreen *" frameborder="0" height="150" style="width:100%;max-width:660px;overflow:hidden;background:transparent;" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-storage-access-by-user-activation allow-top-navigation-by-user-activation" src="https://embed.music.apple.com/ru/album/$1?i=$2"></iframe></span>', $printable_str);

  // RegExp(r'/\\[audio-apple-(\d*)\\]/','<span style="display:inline-block;width:100%;max-width:600px"><iframe allow="autoplay *; encrypted-media *; fullscreen *" frameborder="0" height="450" style="width:100%;max-width:660px;overflow:hidden;background:transparent;" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-storage-access-by-user-activation allow-top-navigation-by-user-activation" src="https://embed.music.apple.com/ru/album/$1"></iframe></span>', $printable_str);

  // RegExp(r'/\\[audio-vocaroo-(.*)?\\]/','<span style="display:inline-block;max-width:300px;width:100%"><iframe width="100%" height="60" src="https://vocaroo.com/embed/$1" frameborder="0"></iframe></span>', $printable_str);

  // RegExp(r'/\\[pin-(\d*)?\\]/',

  // 	'<span class="pin-container" style="display:inline-block;width: 100%;max-width:600px;"><iframe src="https://assets.pinterest.com/ext/embed.html?id=$1" width="100%" frameborder="0" scrolling="no"></iframe></span>',

  // 	$printable_str);

  // RegExp(r'/\\[inst-(.*)?\\]/',

  // 	'<span  class="instagram-container" style="display:inline-block;width: 100%;max-width:320px;">

  // 		<iframe width="100%" height="440" src="https://instagram.com/p/$1/embed" frameborder="0"></iframe>

  // 	</span>',

  // 	$printable_str);

  return str;
}
