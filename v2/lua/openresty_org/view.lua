--[[
   This Lua code was generated by Lemplate, the Lua
   Template Toolkit. Any changes made to this file will be lost the next
   time the templates are compiled.

   Copyright 2016 - Yichun Zhang (agentzh) - All rights reserved.

   Copyright 2006-2014 - Ingy döt Net - All rights reserved.
]]

local gsub = ngx.re.gsub
local concat = table.concat
local type = type
local math_floor = math.floor
local table_maxn = table.maxn

local _M = {
    version = '0.02'
}

local template_map = {}

local function tt2_true(v)
    return v and v ~= 0 and v ~= "" and v ~= '0'
end

local function tt2_not(v)
    return not v or v == 0 or v == "" or v == '0'
end

local context_meta = {}

function context_meta.plugin(context, name, args)
    if name == "iterator" then
        local list = args[1]
        local count = table_maxn(list)
        return { list = list, count = 1, max = count - 1, index = 0, size = count, first = true, last = false, prev = "" }
    else
        return error("unknown iterator: " .. name)
    end
end

function context_meta.process(context, file)
    local f = template_map[file]
    if not f then
        return error("file error - " .. file .. ": not found")
    end
    return f(context)
end

function context_meta.include(context, file)
    local f = template_map[file]
    if not f then
        return error("file error - " .. file .. ": not found")
    end
    return f(context)
end

context_meta = { __index = context_meta }

local function stash_get(stash, k)
    local v
    if type(k) == "table" then
        v = stash
        for i = 1, #k, 2 do
            local key = k[i]
            local typ = k[i + 1]
            if type(typ) == "table" then
                local value = v[key]
                if type(value) == "function" then
                    return value()
                end
                if value then
                    return value
                end
                if key == "size" then
                    if type(v) == "table" then
                        return #v
                    else
                        return 1
                    end
                else
                    return error("virtual method " .. key .. " not supported")
                end
            end
            if type(key) == "number" and key == math_floor(key) and key >= 0 then
                key = key + 1
            end
            if type(v) ~= "table" then
                return nil
            end
            v = v[key]
        end
    else
        v = stash[k]
    end
    if type(v) == "function" then
        return v()
    end
    return v
end

local function stash_set(stash, k, v, default)
    if default then
        local old = stash[k]
        if old == nil then
            stash[k] = v
        end
    else
        stash[k] = v
    end
end

function _M.process(file, params)
    local stash = params
    local context = {
        stash = stash,
        filter = function (bits, name, params)
            local s = concat(bits)
            if name == "html" then
                s = gsub(s, "&", '&amp;', "jo")
                s = gsub(s, "<", '&lt;', "jo");
                s = gsub(s, ">", '&gt;', "jo");
                s = gsub(s, '"', '&quot;', "jo"); -- " end quote for emacs
                return s
            end
        end
    }
    context = setmetatable(context, context_meta)
    local f = template_map[file]
    if not f then
        return error("file error - " .. file .. ": not found")
    end
    return f(context)
end
-- header.tt2
template_map['header.tt2'] = function (context)
    if not context then
        return error("Lemplate function called without context\n")
    end
    local stash = context.stash
    local output = {}
    local i = 0

i = i + 1 output[i] = '<header role="header">\n        <p class="site-name left">\n                <a href=".">OpenResty</a>\n                <small>Scalable Web Platform by Extending NGINX with Lua</small>\n        </p><!-- / site-name -->\n\n        <form action="#" class="right">\n                <fieldset>\n                        <input type="search" name="search" id="search" placeholder="Search OpenResty.org">\n                </fieldset>\n        </form>\n</header>\n'

    return output
end

-- index.tt2
template_map['index.tt2'] = function (context)
    if not context then
        return error("Lemplate function called without context\n")
    end
    local stash = context.stash
    local output = {}
    local i = 0

i = i + 1 output[i] = '<!DOCTYPE html>\n<html lang="en">\n<head>\n	<meta charset="utf-8">\n	<title>OpenResty</title>\n	<link href=\'http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300\' rel=\'stylesheet\' type=\'text/css\'>\n	<!--\n	If you ever wanted to use LESS instead of CSS...\n	<link rel="stylesheet" type="text/less" href="/css/main.less">\n	<script src="/js/less.js"></script>\n	-->\n	<link rel="stylesheet" type="text/css" href="/css/main.css">\n        <script src="/js/jquery.min.js"></script>\n        <script>\n        (function () {\n            var permlinks = {About:\'about\',ArrayVarNginxModule:\'array-var-nginx-module\',AuthRequestNginxModule:\'auth-request-nginx-module\',Benchmark:\'benchmark\',BuildSystemtap:\'build-systemtap\',ChangeLog1000004:\'change-log-1000004\',ChangeLog1000005:\'change-log-1000005\',ChangeLog1000006:\'change-log-1000006\',ChangeLog1000008:\'change-log-1000008\',ChangeLog1000009:\'change-log-1000009\',ChangeLog1000010:\'change-log-1000010\',ChangeLog1000011:\'change-log-1000011\',ChangeLog1000015:\'change-log-1000015\',ChangeLog1002001:\'change-log-1002001\',ChangeLog1002003:\'change-log-1002003\',ChangeLog1002004:\'change-log-1002004\',ChangeLog1002006:\'change-log-1002006\',ChangeLog1002007:\'change-log-1002007\',ChangeLog1002008:\'change-log-1002008\',ChangeLog1004001:\'change-log-1004001\',ChangeLog1004002:\'change-log-1004002\',ChangeLog1004003:\'change-log-1004003\',ChangeLog1005008:\'change-log-1005008\',ChangeLog1005011:\'change-log-1005011\',ChangeLog1005012:\'change-log-1005012\',ChangeLog1007000:\'change-log-1007000\',ChangeLog1007002:\'change-log-1007002\',ChangeLog1007004:\'change-log-1007004\',ChangeLog1007007:\'change-log-1007007\',ChangeLog1007010:\'change-log-1007010\',ChangeLog1009003:\'change-log-1009003\',ChangeLog1009007:\'change-log-1009007\',ChangeLog8054:\'change-log-8054\',Changes:\'changes\',Community:\'community\',Components:\'components\',ContactUs:\'contact-us\',CoolkitNginxModule:\'coolkit-nginx-module\',Debugging:\'debugging\',DonateOnline:\'donate-online\',Donors:\'donors\',Download:\'download\',DrizzleNginxModule:\'drizzle-nginx-module\',DynamicRoutingBasedOnRedis:\'dynamic-routing-based-on-redis\',EchoNginxModule:\'echo-nginx-module\',EncryptedSessionNginxModule:\'encrypted-session-nginx-module\',FastCGINginxModule:\'fastcgi-nginx-module\',FormInputNginxModule:\'form-input-nginx-module\',GettingInvolved:\'getting-involved\',GettingStarted:\'getting-started\',GitHub:\'github\',HeadersMoreNginxModule:\'headers-more-nginx-module\',IconvNginxModule:\'iconv-nginx-module\',Installation:\'installation\',LuaCjsonLibrary:\'lua-cjson-library\',LuaJIT:\'luajit\',LuaNginxModule:\'lua-nginx-module\',LuaRdsParserLibrary:\'lua-rds-parser-library\',LuaRedisParserLibrary:\'lua-redis-parser-library\',LuaRestyCoreLibrary:\'lua-resty-core-library\',LuaRestyDNSLibrary:\'lua-resty-dns-library\',LuaRestyLockLibrary:\'lua-resty-lock-library\',LuaRestyLrucacheLibrary:\'lua-resty-lrucache-library\',LuaRestyMemcachedLibrary:\'lua-resty-memcached-library\',LuaRestyMySQLLibrary:\'lua-resty-mysql-library\',LuaRestyRedisLibrary:\'lua-resty-redis-library\',LuaRestyStringLibrary:\'lua-resty-string-library\',LuaRestyUploadLibrary:\'lua-resty-upload-library\',LuaRestyUpstreamHealthcheckLibrary:\'lua-resty-upstream-healthcheck-library\',LuaRestyWebSocketLibrary:\'lua-resty-web-socket-library\',LuaUpstreamNginxModule:\'lua-upstream-nginx-module\',MainMenu:\'main-menu\',MemcNginxModule:\'memc-nginx-module\',Nginx:\'nginx\',NginxDevelKit:\'nginx-devel-kit\',OpenResty:\'openresty\',PostgresNginxModule:\'postgres-nginx-module\',Presentations:\'presentations\',Profiling:\'profiling\',ProxyNginxModule:\'proxy-nginx-module\',QualityAssurance:\'quality-assurance\',RSSFeed:\'rss-feed\',RdsCsvNginxModule:\'rds-csv-nginx-module\',RdsJsonNginxModule:\'rds-json-nginx-module\',Redis2NginxModule:\'redis-2-nginx-module\',RedisNginxModule:\'redis-nginx-module\',ReleaseNote:\'release-note\',Resources:\'resources\',RestyCLI:\'resty-cli\',RoutingMySQLQueriesBasedOnURIArgs:\'routing-mysql-queries-based-on-uri-args\',Samples:\'samples\',SetMiscNginxModule:\'set-misc-nginx-module\',SrcacheNginxModule:\'srcache-nginx-module\',StandardLuaInterpreter:\'standard-lua-interpreter\',Upgrading:\'upgrading\',UpstreamKeepaliveNginxModule:\'upstream-keepalive-nginx-module\',UsingLuaRocks:\'using-luarocks\',XssNginxModule:\'xss-nginx-module\',YichunZhang:\'yichun-zhang\',eBooks:\'ebooks\',libdrizzle:\'libdrizzle\'};\n            var hash = window.location.hash;\n            var key = hash.substring(1, hash.length);\n            //alert(key)\n            var file = permlinks[key];\n            if (file) {\n                window.location.hash = "";\n                window.location = window.location.pathname + file + ".html";\n            }\n        })();\n        </script>\n	<script src="js/main.js"></script>\n</head>\n<body>\n\n'
-- line 31 "index.tt2"
i = i + 1 output[i] = context.process(context, 'header.tt2')
i = i + 1 output[i] = '\n\n	<section id="intro">\n		<div class="text">\n			<p>OpenResty is a dynamic web platform based on NGINX and LuaJIT.</p>\n			<p><small>It’s open-source stuff so you can contribute:</small> <a href="https://github.com/openresty/" class="github">Contribute on GitHub &raquo;</a></p>\n		</div><!-- / text -->\n	</section><!-- / intro -->\n\n	<div id="wrapper">\n		<div class="sidebar sleft">\n			<nav id="nav">\n'
-- line 43 "index.tt2"
i = i + 1 output[i] = stash_get(stash, 'main_menu')
i = i + 1 output[i] = '\n			</nav><!-- / nav -->\n\n'
-- line 46 "index.tt2"
i = i + 1 output[i] = context.process(context, 'main-menu-buttons.tt2')
i = i + 1 output[i] = '\n\n		</div><!-- / sidebar left -->\n		\n		<section id="main">\n'
-- line 51 "index.tt2"
i = i + 1 output[i] = context.process(context, 'post.tt2')
i = i + 1 output[i] = '\n		</section><!-- / main -->\n\n		<div class="sidebar sright">\n			<div class="options">\n                                <!--\n				<ul class="first">\n					<li><a href="#" class="close-all">close all</a></li>\n					<li><a href="#" class="permaview">permaview</a></li>\n					<li><a href="#" class="more-options">options</a></li>\n                                </ul> --><!-- / first -->\n			</div><!-- options -->\n\n			<div class="tabs">\n				<ul class="navigation">\n					<li><a href="#" class="current">Timeline</a></li>\n					<li><a href="#">All</a></li>\n					<li><a href="#">Tags</a></li>\n					<li><a href="#">More</a></li>\n				</ul><!-- / navigation -->\n				<div class="panes">\n					<div class="pane" id="timeline">\n						<ul>\n							<li>\n								<h3>15 April 2014</h3>\n								<ul>\n									<li><a href="#">OpenResty</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>30 March 2014</h3>\n								<ul>\n									<li><a href="#">Download</a></li>\n									<li><a href="#">ChangeLog1005011</a></li>\n									<li><a href="#">LuaUpstreamNginxModule</a></li>\n									<li><a href="#">LuaRestyUpstreamHealthcheckLibrary</a></li>\n									<li><a href="#">Components</a></li>\n								</ul>\n\n							</li>\n							<li>\n								<h3>25 March 2014</h3>\n								<ul>\n									<li><a href="#">Changes</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>4 March 2014</h3>\n								<ul>\n									<li><a href="#">BuildSystemtap</a></li>\n									<li><a href="#">DynamicRoutingBasedOnRedis</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>28 February 2014</h3>\n								<ul>\n									<li><a href="#">Presentations</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>25 January 2014</h3>\n								<ul>\n									<li><a href="#">UsingLuaRocks</a></li>\n									<li><a href="#">LuaJIT</a></li>\n									<li><a href="#">Installation</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>11 January 2014</h3>\n								<ul>\n									<li><a href="#">ChangeLog1005008</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>14 December 2013</h3>\n								<ul>\n									<li><a href="#">ChangeLog1004003</a></li>\n									<li><a href="#">LuaRestyCoreLibrary</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>17 October 2013</h3>\n								<ul>\n									<li><a href="#">SrcacheNginxModule</a></li>\n									<li><a href="#">SetMiscNginxModule</a></li>\n									<li><a href="#">Redis2NginxModule</a></li>\n									<li><a href="#">LuaRedisParserLibrary</a></li>\n									<li><a href="#">LuaNginxModule</a></li>\n									<li><a href="#">HeadersMoreNginxModule</a></li>\n									<li><a href="#">MemcNginxModule</a></li>\n									<li><a href="#">EchoNginxModule</a></li>\n									<li><a href="#">DrizzleNginxModule</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>6 October 2013</h3>\n								<ul>\n									<li><a href="#">Debugging</a></li>\n									<li><a href="#">MainMenu</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>30 September 2013</h3>\n								<ul>\n									<li><a href="#">ChangeLog1004002</a></li>\n									<li><a href="#">CoolkitNginxModule</a></li>\n								</ul>\n							</li>\n						</ul>\n					</div><!-- / pane -->\n				</div><!-- / panes -->\n			</div><!-- / tabs -->\n		</div><!-- / sidebar right -->\n	</div><!-- / wrapper -->\n</body>\n</html>\n'

    return output
end

-- main-menu-buttons.tt2
template_map['main-menu-buttons.tt2'] = function (context)
    if not context then
        return error("Lemplate function called without context\n")
    end
    local stash = context.stash
    local output = {}
    local i = 0

i = i + 1 output[i] = '<ul class="buttons">\n    <li><a href="#" class="btn rss">RSS Feed</a></li>\n    <li>\n        <!-- <a href="#" class="btn paypal">Donate with PayPal</a> -->\n        <form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">\n        <input type="hidden" name="cmd" value="_xclick">\n        <input type="hidden" name="business" value="agentzh@gmail.com">\n        <input type="hidden" name="item_name" value="OpenResty Donation (in USD)">\n        <input type="hidden" name="currency_code" value="USD">\n        <input type="hidden" name="amount" value="">\n        <input type="image" src="/images/donate_paypal.gif" border="0" name="submit" alt="Donate with PayPal">\n        </form>\n    </li>\n</ul>\n'

    return output
end

-- page.tt2
template_map['page.tt2'] = function (context)
    if not context then
        return error("Lemplate function called without context\n")
    end
    local stash = context.stash
    local output = {}
    local i = 0

i = i + 1 output[i] = '<!DOCTYPE html>\n<html lang="en">\n<head>\n	<meta charset="utf-8">\n	<title>OpenResty</title>\n	<link href=\'http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300\' rel=\'stylesheet\' type=\'text/css\'>\n	<!--\n	If you ever wanted to use LESS instead of CSS...\n	<link rel="stylesheet" type="text/less" href="/css/main.less">\n	<script src="/js/less.js"></script>\n	-->\n	<link rel="stylesheet" type="text/css" href="/css/main.css">\n	<script src="/js/jquery.min.js"></script>\n	<script src="/js/main.js"></script>\n</head>\n<body>\n\n'
-- line 18 "page.tt2"
i = i + 1 output[i] = context.process(context, 'header.tt2')
i = i + 1 output[i] = '\n\n	<div id="wrapper">\n		<div class="sidebar sleft">\n			<nav id="nav">\n'
-- line 23 "page.tt2"
i = i + 1 output[i] = stash_get(stash, 'main_menu')
i = i + 1 output[i] = '\n			</nav><!-- / nav -->\n\n'
-- line 26 "page.tt2"
i = i + 1 output[i] = context.process(context, 'main-menu-buttons.tt2')
i = i + 1 output[i] = '\n\n		</div><!-- / sidebar left -->\n		\n		<section id="main">\n'
-- line 31 "page.tt2"
i = i + 1 output[i] = context.process(context, 'post.tt2')
i = i + 1 output[i] = '\n		</section><!-- / main -->\n\n		<div class="sidebar sright">\n			<div class="options">\n                                <!--\n				<ul class="first">\n					<li><a href="#" class="close-all">close all</a></li>\n					<li><a href="#" class="permaview">permaview</a></li>\n					<li><a href="#" class="more-options">options</a></li>\n                                </ul> --> <!-- / first -->\n			</div><!-- options -->\n\n			<div class="tabs">\n				<ul class="navigation">\n					<li><a href="#" class="current">Timeline</a></li>\n					<li><a href="#">All</a></li>\n					<li><a href="#">Tags</a></li>\n					<li><a href="#">More</a></li>\n				</ul><!-- / navigation -->\n				<div class="panes">\n					<div class="pane" id="timeline">\n						<ul>\n							<li>\n								<h3>15 April 2014</h3>\n								<ul>\n									<li><a href="#">OpenResty</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>30 March 2014</h3>\n								<ul>\n									<li><a href="#">Download</a></li>\n									<li><a href="#">ChangeLog1005011</a></li>\n									<li><a href="#">LuaUpstreamNginxModule</a></li>\n									<li><a href="#">LuaRestyUpstreamHealthcheckLibrary</a></li>\n									<li><a href="#">Components</a></li>\n								</ul>\n\n							</li>\n							<li>\n								<h3>25 March 2014</h3>\n								<ul>\n									<li><a href="#">Changes</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>4 March 2014</h3>\n								<ul>\n									<li><a href="#">BuildSystemtap</a></li>\n									<li><a href="#">DynamicRoutingBasedOnRedis</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>28 February 2014</h3>\n								<ul>\n									<li><a href="#">Presentations</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>25 January 2014</h3>\n								<ul>\n									<li><a href="#">UsingLuaRocks</a></li>\n									<li><a href="#">LuaJIT</a></li>\n									<li><a href="#">Installation</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>11 January 2014</h3>\n								<ul>\n									<li><a href="#">ChangeLog1005008</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>14 December 2013</h3>\n								<ul>\n									<li><a href="#">ChangeLog1004003</a></li>\n									<li><a href="#">LuaRestyCoreLibrary</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>17 October 2013</h3>\n								<ul>\n									<li><a href="#">SrcacheNginxModule</a></li>\n									<li><a href="#">SetMiscNginxModule</a></li>\n									<li><a href="#">Redis2NginxModule</a></li>\n									<li><a href="#">LuaRedisParserLibrary</a></li>\n									<li><a href="#">LuaNginxModule</a></li>\n									<li><a href="#">HeadersMoreNginxModule</a></li>\n									<li><a href="#">MemcNginxModule</a></li>\n									<li><a href="#">EchoNginxModule</a></li>\n									<li><a href="#">DrizzleNginxModule</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>6 October 2013</h3>\n								<ul>\n									<li><a href="#">Debugging</a></li>\n									<li><a href="#">MainMenu</a></li>\n								</ul>\n							</li>\n							<li>\n								<h3>30 September 2013</h3>\n								<ul>\n									<li><a href="#">ChangeLog1004002</a></li>\n									<li><a href="#">CoolkitNginxModule</a></li>\n								</ul>\n							</li>\n						</ul>\n					</div><!-- / pane -->\n				</div><!-- / panes -->\n			</div><!-- / tabs -->\n		</div><!-- / sidebar right -->\n	</div><!-- / wrapper -->\n	\n	\n\n</body>\n</html>\n  \n'

    return output
end

-- post.tt2
template_map['post.tt2'] = function (context)
    if not context then
        return error("Lemplate function called without context\n")
    end
    local stash = context.stash
    local output = {}
    local i = 0

i = i + 1 output[i] = '<div class="item">\n        <header>\n                <h2>'
-- line 3 "post.tt2"

-- FILTER
local value
do
    local output = {}
    local i = 0

i = i + 1 output[i] = stash_get(stash, 'title')

    value = context.filter(output, 'html', {})
end
i = i + 1 output[i] = value

i = i + 1 output[i] = '</h2>'
-- line 10 "post.tt2"
if tt2_true(tt2_not(stash_get(stash, 'skip_meta'))) then
i = i + 1 output[i] = '\n                <small>\n                    '
-- line 6 "post.tt2"
if tt2_true(stash_get(stash, 'modifier_link')) then
i = i + 1 output[i] = '<a href="'
-- line 6 "post.tt2"
i = i + 1 output[i] = stash_get(stash, 'modifier_link')
i = i + 1 output[i] = '.html">'
end

i = i + 1 output[i] = '\n                    '
-- line 7 "post.tt2"
i = i + 1 output[i] = stash_get(stash, 'modifier')
i = i + 1 output[i] = '\n                    '
-- line 8 "post.tt2"
if tt2_true(stash_get(stash, 'modifier_link')) then
i = i + 1 output[i] = '</a>'
end

i = i + 1 output[i] = ',\n                    '
-- line 9 "post.tt2"
i = i + 1 output[i] = stash_get(stash, 'modified')
i = i + 1 output[i] = ' (created '
-- line 9 "post.tt2"
i = i + 1 output[i] = stash_get(stash, 'created')
i = i + 1 output[i] = ')</small>'
end

i = i + 1 output[i] = '\n                <div class="options">\n                        <!--\n                        <a href="#" class="trigger">Show Options</a>\n                        <ul class="first-level">\n                                <li><a href="#">close</a></li>\n                                <li><a href="#">close others</a></li>\n                                <li><a href="#">view</a></li>\n                                <li><a href="#">fields</a></li>\n                                <li><a href="#">syncing</a></li>\n                                <li><a href="#">permalink</a></li>\n                                <li><a href="#">references</a></li>\n                                <li>\n                                        <a href="#">jump</a>\n                                        <ul class="second-level">\n                                                <li><a href="#">Benchmark</a></li>\n                                                <li><a href="#">Presentations</a></li>\n                                                <li><a href="#">eBooks</a></li>\n                                        </ul>\n                                </li>\n                        </ul>\n                        -->\n                </div><!-- / options -->\n        </header>\n        <div class="body">\n'
-- line 35 "post.tt2"
i = i + 1 output[i] = stash_get(stash, 'body')
i = i + 1 output[i] = '\n        </div><!-- / body -->\n</div><!-- / item -->\n'

    return output
end

return _M