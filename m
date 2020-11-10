Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D0C2AD757
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 14:18:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B01DD420668;
	Tue, 10 Nov 2020 14:18:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 50B1E420668
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 14:18:48 +0100 (CET)
Received: by mail-io1-f68.google.com with SMTP id u19so13976010ion.3
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oEepPjoxQh4by2i1OUx0PczgyO82cTraxc4u4YycwTI=;
	b=Xmn6aluTO4DHhV/TY1XoC9mpgeQdsCVP6ELet/LL14/oJE3u6iCZ7q0bSEez7AOwEN
	+eaeB0B8pp29mqdJralYw4DJU0tc+w+6Ycy8n/z64IRFetypz0mPABcsA7Ub9RvTsT0f
	teFyemPWLZAmJG6COCilJc2TBmeCu4Y+P0xvg3JRfKQdZ2vL3iPLAQgRVt6Adi3rDa5d
	T+66Gzq8dKcbiPZuySkG2JMC9viLbJ/smSxAhE3nhh5TqO/5FDwoWU9uyaYPQSnPeTmG
	3HoEYnRCGpW6Ip4XKrGOFeQAKooDdwymkngoxMU13Y4FDjx31OjtYs2rMsgV8/7+wPDI
	Iwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oEepPjoxQh4by2i1OUx0PczgyO82cTraxc4u4YycwTI=;
	b=nOB1htSuPLF/GB/wMseYGPhzw3fvfRpab1bYrW1kJDWQ9gDJx2eE/Rvw06ysLqDgoZ
	WV0E1d1TsPOaggM6GwVfhOr5iNbMf8y2RHsIXiRT18iuBF281utPCOkOwqpB3URE+rHG
	qmR2uwmd73t3VekGuxKQSFkGSF3jWn4DX3AC0NQzRKMq1yzSm9KsYqUjDP5JOL3kVF1y
	lo6r+GzihXAL8S267zV/4XXHfOD3QQ8IrPua3S2sZ9EXSq9giF9v9QhbE9/KDK2gAn6i
	N3U3hb1TuIsHnKzCRyduDcbkKnef8gWMJV/fe1wWVNQVXESqnNaHsqCpdtPl8s5brdUN
	w2jg==
X-Gm-Message-State: AOAM533FHZ3rMXGV0bYWif9Yv0lvvypf883o4l3MRRZneTpcQzCsbBRW
	RFqhGf7lKMrgdtWWdg7KpDUoyApKuzb1PZn/ct6YtnMGwrq5JYOp
X-Google-Smtp-Source: ABdhPJx++SmLo5gt87teHiR7aAkHBXB7kc5g9zNikPdorH55ojPkRPezwG2MFUzfGDN3gtoiHZ3nqr+tnJ36mEgsw1k=
X-Received: by 2002:a6b:5007:: with SMTP id e7mr13647239iob.185.1605014328199; 
	Tue, 10 Nov 2020 05:18:48 -0800 (PST)
MIME-Version: 1.0
References: <c8a948e4-5bd0-f5e0-363d-7abd2d0a41f1@easystack.cn>
In-Reply-To: <c8a948e4-5bd0-f5e0-363d-7abd2d0a41f1@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Tue, 10 Nov 2020 14:18:37 +0100
Message-ID: <CADGDV=X=H0zoste5SqnT-nhJMS1HE-WQ+W6nWkq5L_2akE-q9A@mail.gmail.com>
To: Zhang Duan <duan.zhang@easystack.cn>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: reply cancel to source when target of
 verify becomes inconsistent
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
Content-Type: multipart/mixed; boundary="===============2579457459174813762=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============2579457459174813762==
Content-Type: multipart/alternative; boundary="000000000000e4697305b3c084c9"

--000000000000e4697305b3c084c9
Content-Type: text/plain; charset="UTF-8"

Hi Zhang,

Thanks for the patch. I verified it. Everything is as you describe. I
applied it to the drbd-9.0 branch.

best regards,
 Phil

On Tue, Nov 10, 2020 at 3:31 AM Zhang Duan <duan.zhang@easystack.cn> wrote:

> Consider one situation below:
> 1. primary A disconnects with secondary B & C both of which are Uptodate
> 2. start a verify from B to C
> 3. during the verify above, A reconnects and starts a resync to C because
> of
> primary-lost-quorum
> 4. C becomes resync target and Inconsistent, then ignore the verify
> requests
> from B which are already in its receive buffer
> 5. verify from B to C stalls here
>
> To resolve it, at step 4, C should reply a message of P_RS_CANCEL to B
> Here is the result if do that:
> Nov 6 16:25:46 node-2 kernel: drbd drbd1/0 drbd1 node-3: Skipped verify,
> too busy: start=170208, size=48 (sectors)
> Nov 6 16:25:46 node-2 kernel: drbd drbd1/0 drbd1 node-3: Online verify
> done but 6 4k blocks skipped (total 314 sec; paused 0 sec; 3336 K/sec)
> Nov 6 16:25:46 node-2 kernel: drbd drbd1/0 drbd1 node-3: repl( VerifyS ->
> Established )
>
> Signed-off-by: ZhangDuan
> ---
> drbd/drbd_receiver.c | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
> index 268dbf4d..c6d4b7c9 100644
> --- a/drbd/drbd_receiver.c
> +++ b/drbd/drbd_receiver.c
> @@ -3273,6 +3273,8 @@ static int receive_DataRequest(struct
> drbd_connection *connection, struct packet
> break;
> case P_OV_REQUEST:
> verify_skipped_block(peer_device, sector, size);
> + drbd_send_ack_rp(peer_device, P_RS_CANCEL, p);
> + break;
> /* Fall through */
> case P_RS_THIN_REQ:
> case P_RS_DATA_REQUEST:
> --
> 2.24.0.windows.2
>
> --
> Sincerely Yours,
> Zhang Duan
>
>

--000000000000e4697305b3c084c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Zhang,<div><br></div><div>Thanks for the patch. I verif=
ied it. Everything is as you describe. I applied it to the drbd-9.0=C2=A0br=
anch.</div><div><br></div><div>best regards,</div><div>=C2=A0Phil</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Nov 10, 2020 at 3:31 AM Zhang Duan &lt;<a href=3D"mailto:duan.zhang@eas=
ystack.cn">duan.zhang@easystack.cn</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
 =20

   =20
 =20
  <div>
    <p>Consider one situation below:</p>
    1. primary A disconnects with secondary B &amp; C both of which are
    Uptodate<br>
    2. start a verify from B to C<br>
    3. during the verify above, A reconnects and starts a resync to C
    because of<br>
    primary-lost-quorum<br>
    4. C becomes resync target and Inconsistent, then ignore the verify
    requests<br>
    from B which are already in its receive buffer<br>
    5. verify from B to C stalls here<br>
    <br>
    To resolve it, at step 4, C should reply a message of P_RS_CANCEL to
    B<br>
    Here is the result if do that:<br>
    Nov 6 16:25:46 node-2 kernel: drbd drbd1/0 drbd1 node-3: Skipped
    verify, too busy: start=3D170208, size=3D48 (sectors)<br>
    Nov 6 16:25:46 node-2 kernel: drbd drbd1/0 drbd1 node-3: Online
    verify done but 6 4k blocks skipped (total 314 sec; paused 0 sec;
    3336 K/sec)<br>
    Nov 6 16:25:46 node-2 kernel: drbd drbd1/0 drbd1 node-3: repl(
    VerifyS -&gt; Established )<br>
    <br>
    Signed-off-by: ZhangDuan <u></u><br>
      ---<br>
      drbd/drbd_receiver.c | 2 ++<br>
      1 file changed, 2 insertions(+)<br>
      <br>
      diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c<br>
      index 268dbf4d..c6d4b7c9 100644<br>
      --- a/drbd/drbd_receiver.c<br>
      +++ b/drbd/drbd_receiver.c<br>
      @@ -3273,6 +3273,8 @@ static int receive_DataRequest(struct
      drbd_connection *connection, struct packet<br>
      break;<br>
      case P_OV_REQUEST:<br>
      verify_skipped_block(peer_device, sector, size);<br>
      + drbd_send_ack_rp(peer_device, P_RS_CANCEL, p);<br>
      + break;<br>
      /* Fall through */<br>
      case P_RS_THIN_REQ:<br>
      case P_RS_DATA_REQUEST:<br>
      -- <br>
      2.24.0.windows.2<br>
      <br>
    <u></u>
    <pre cols=3D"72">--=20
Sincerely Yours,
Zhang Duan</pre>
  </div>

</blockquote></div>

--000000000000e4697305b3c084c9--

--===============2579457459174813762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============2579457459174813762==--
