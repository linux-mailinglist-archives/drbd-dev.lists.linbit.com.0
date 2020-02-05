Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680917A5FF
	for <lists+drbd-dev@lfdr.de>; Thu,  5 Mar 2020 14:06:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2C3E4203E9;
	Thu,  5 Mar 2020 14:06:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 315 seconds by postgrey-1.31 at mail19;
	Wed, 05 Feb 2020 11:12:53 CET
Received: from m97134.mail.qiye.163.com (m97134.mail.qiye.163.com
	[220.181.97.134])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B2789420318
	for <drbd-dev@lists.linbit.com>; Wed,  5 Feb 2020 11:12:52 +0100 (CET)
Received: from [192.168.31.179] (unknown [222.212.248.138])
	by smtp5 (Coremail) with SMTP id huCowAAX_NjmkzpeKo11BQ--.19576S2;
	Wed, 05 Feb 2020 18:07:34 +0800 (CST)
To: drbd-dev@lists.linbit.com
From: Duan Zhang <duan.zhang@easystack.cn>
Message-ID: <3ce8a016-90be-7f0d-2d2d-a810da7f5f67@easystack.cn>
Date: Wed, 5 Feb 2020 18:07:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.0
MIME-Version: 1.0
X-CM-TRANSID: huCowAAX_NjmkzpeKo11BQ--.19576S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUFR6wDUUUU
X-Originating-IP: [222.212.248.138]
X-CM-SenderInfo: hgxd0hx2kd0w46hd255vwduygofq/1tbihAfAjlsfm+BPSAAAs1
X-Mailman-Approved-At: Thu, 05 Mar 2020 14:06:47 +0100
Subject: [Drbd-dev] Bug Report : meet an unexcepted WFBitMapS status after
 restarting the primary
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7225426396006801530=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

This is a multi-part message in MIME format.
--===============7225426396006801530==
Content-Type: multipart/alternative;
 boundary="------------6409C47BE022F47D03E56638"

This is a multi-part message in MIME format.
--------------6409C47BE022F47D03E56638
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit

Version: drbd-9.0.21-1

Layout: drbd.res within 3 nodes -- node-1(Secondary), node-2(Primary), node-3(Secondary)

Description:
a.reboot node-2 when cluster is working.
b.re-up the drbd.res on node-2 after it restarted.
c.an expected resync from node-3 to node-2 happens. When the resync is done, however,
   node-1 raises an unexpected WFBitMapS repl status and can't recover to normal anymore.

Status output:

node-1: drbdadm status

drbd6 role:Secondary

disk:UpToDate

hotspare connection:Connecting

node-2 role:Primary

replication:WFBitMapS peer-disk:Consistent

node-3 role:Secondary

peer-disk:UpToDate


node-2: drbdadm status

drbd6 role:Primary

disk:UpToDate

hotspare connection:Connecting

node-1 role:Secondary

peer-disk:UpToDate

node-3 role:Secondary

peer-disk:UpToDate

I assume that there is a process sequence below according to my source 
code version: node-1 node-2 node-3 restarted with CRASHED_PRIMARY start 
sync with node-3 as target start sync with node-2 as source бн бн end sync 
with node-3 end sync with node-2 w_after_state_change loop 1 within for 
loop against node-1:(a)
receive_uuids10 send uuid with UUID_FLAG_GOT_STABLE&CRASHED_PRIMARY to 
node-1
receive uuid of node-2 with CRASHED_PRIMARY loop 2 within for loop 
against node-3: clear CRASHED_PRIMARY(b) send uuid to node-2 with 
UUID_FLAG_RESYNC receive uuids10 sync_handshake to 
SYNC_SOURCE_IF_BOTH_FAILED sync_handshake to NO_SYNC change repl state 
to WFBitMapS The key problem is about the order of step(a) and step(b), 
that is, node-2 sends the unexpected CRASHED_PRIMARY to node-1 though 
it's actually no longer a crashed primary after syncing with node-3.So 
may I have the below questions: a.If this is really a BUG or just an 
expected result? b.If there's already a patch fix within the newest 
verion? c.If there's some workaround method against this kind of 
unexcepted status, since I really meet so many other problems like that :(

-- 
Sincerely Yours,
Zhang Duan


--------------6409C47BE022F47D03E56638
Content-Type: text/html; charset=gbk
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre>Version: drbd-9.0.21-1</pre>
    <pre>Layout: drbd.res within 3 nodes -- node-1(Secondary), node-2(Primary), node-3(Secondary)</pre>
    <pre>Description: 
a.reboot node-2 when cluster is working.
b.re-up the drbd.res on node-2 after it restarted.
c.an expected resync from node-3 to node-2 happens. When the resync is done, however,
  node-1 raises an unexpected WFBitMapS repl status and can't recover to normal anymore.

Status output:
</pre>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">node-1:
        drbdadm status</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">drbd6
        role:Secondary</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">disk:UpToDate</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">hotspare
        connection:Connecting</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">node-2
        role:Primary</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">replication:WFBitMapS
        peer-disk:Consistent</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">node-3
        role:Secondary</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">peer-disk:UpToDate</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1"><br>
      </font> </p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">node-2:
        drbdadm status</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">drbd6
        role:Primary</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">disk:UpToDate</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">hotspare
        connection:Connecting</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">node-1
        role:Secondary</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">peer-disk:UpToDate</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">node-3
        role:Secondary</font></p>
    <font size="-1"> </font>
    <p style="margin: 10px 0px 0px; padding: 0px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: normal; letter-spacing: normal; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="-1">peer-disk:UpToDate</font><tt><br>
      </tt></p>
    <pre><tt>I assume that there is a process sequence below according to my source code version:
node-1                                           node-2                                                            node-3
					         restarted with CRASHED_PRIMARY               
					         start sync with node-3 as target                                  start sync with node-2 as source
					         бн                                                                бн
                                                 end sync with node-3                                              end sync with node-2
					         w_after_state_change
             				         loop 1 within for loop against node-1:(a)</tt>
<tt><tt>receive_uuids10                                  </tt>send uuid with UUID_FLAG_GOT_STABLE&amp;</tt><tt><tt>CRASHED_PRIMARY</tt> to node-1</tt>
<tt><tt>receive uuid of node-2 with CRASHED_PRIMARY</tt>      loop 2 within for loop against node-3:
					         clear  CRASHED_PRIMARY(b)
send uuid to node-2 with UUID_FLAG_RESYNC        </tt><tt><tt>receive uuids10</tt>
</tt><tt><tt>sync_handshake</tt> to SYNC_SOURCE_IF_BOTH_FAILED     </tt><tt><tt>sync_handshake to NO_SYNC</tt>
change repl state to </tt><tt>WFBitMapS

The key problem is about the order of step(a) and step(b), that is, node-2 sends the
unexpected  </tt><tt><tt><tt>CRASHED_PRIMARY</tt> to node-1 though it's actually no longer a crashed primary
after syncing with node-3.</tt></tt><tt><tt>
So may I have the below questions:
a.If this is really a BUG or just an expected result?
b.If there's already a patch fix within the newest verion?
c.If there's some workaround method against this kind of unexcepted status, since I really
  meet so many other problems like that :( 
</tt></tt></pre>
    <pre class="moz-signature" cols="72">-- 
Sincerely Yours,
Zhang Duan</pre>
  </body>
</html>

--------------6409C47BE022F47D03E56638--


--===============7225426396006801530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============7225426396006801530==--

