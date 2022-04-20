Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB85085CF
	for <lists+drbd-dev@lfdr.de>; Wed, 20 Apr 2022 12:22:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B935B420352;
	Wed, 20 Apr 2022 12:22:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
	[209.85.218.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C9230420164
	for <drbd-dev@lists.linbit.com>; Wed, 20 Apr 2022 12:22:43 +0200 (CEST)
Received: by mail-ej1-f54.google.com with SMTP id g13so2563541ejb.4
	for <drbd-dev@lists.linbit.com>; Wed, 20 Apr 2022 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mpFHEL5p0sggB57W/Ivhjmrav/R1jSx4HnTkAGQYgV8=;
	b=F4eqY7uqvUiCsc5V/cw7gS1fC1DI4nUtMvRds0mGalpoUkHSXy4VCm1qxHV0YtZEgT
	vPDilnzxNB/ajpTbj5B84aJ68WeJzJC5O0K9pPRgBkwciaj0pl43k/xelAOW/gGA/bdg
	94xv4i7+qEWd2Iwx7CxUnRTu4KIpBNRmT1btCGtj13PZEz13bMkdBKV9RVNEb4iZXqxt
	/upMzRbHyG4lPi0JyyIOdxHFH0bLa+Y2iBEpzWHCxw4VuqF8/oTKj+dpdqACPEN2LbRi
	sNGz7ru9iY7LKax2KLpkv0lmgqgFOUK08Hog5TCKuCmYqIo5wimQQhnJhKsrXDXs5ApZ
	F6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mpFHEL5p0sggB57W/Ivhjmrav/R1jSx4HnTkAGQYgV8=;
	b=V7g1lGJEU6S2EDjcf6gC17I4YXcRALP1hqqqVzYsATOOoatQACDW3mL525FxvSjgRa
	zClfm+Tsd1ydQ2h0Mg/6QzPcppisOpr5/JHGfavnuqDsVbzPYPDsXzGxsp+idT5jSiUX
	3lmuUKBASjegBsYHMNbUe2LPdNSS9OVTtxfP9ZGzZ47faJZ/nrEGaccy/96BKphYpbUz
	c6msKS1l/l6E+nqDDpLypbDZJtJBn5wgsMQJz3KkFByFL70w3sdyvE1HIBhndElef8hP
	p69oZTNp5V988HDjVLoTKn5gzSRcxE3y/eR/ZdQUSz2OBgWU7Lx5WEt6atEsrNHKr4tv
	v3mg==
X-Gm-Message-State: AOAM533xLXoXauhta6gkouxrFOPFzfgRrBLxGNQNH8bp7musGUbScmSl
	LUF1/gbYXrvpocWMvI3V0lCB/L3NpzYDoQFG6rCW0Y9I
X-Google-Smtp-Source: ABdhPJw6AFBzeL92hxTwqw6DBLlmrurhLwYI0pYxV1ourBGtM+L5A2mB5ZmBcQcZ840Hg8sJoZQwcQNnB0ctYGtdWZI=
X-Received: by 2002:a17:906:dc93:b0:6e8:8d89:8099 with SMTP id
	cs19-20020a170906dc9300b006e88d898099mr17734536ejc.438.1650450163263;
	Wed, 20 Apr 2022 03:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220419121647.638794-1-rui.xu@easystack.cn>
In-Reply-To: <20220419121647.638794-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Wed, 20 Apr 2022 12:22:32 +0200
Message-ID: <CAGNP_+Wfbohf2NkB+LXhHSBEQk_jK-Xi+-wRJimG3G0Z2pbbqg@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: fix a race of drbd_free_peer_req
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Xu,

I think there is a potential race here, but I am not convinced that
this is a general solution. The peer request could still be freed by
got_peer_ack() between checking "list_empty(&peer_req->recv_order)"
and freeing it in drbd_finish_peer_reqs(). Also, this solution keeps
the page chain for peer requests for an unnecessarily long time, which
is not ideal in memory constrained situations.

The underlying race, as far as I understand it, is that got_peer_ack()
can be called while still processing the request in
drbd_finish_peer_reqs(). This is only relevant for peer writes and not
resync, so only the e_end_block() path is of interest. got_peer_ack()
will only be called after we have sent the corresponding barrier ack
for the peer request.

On the basis of this reasoning, I think a simple solution is to swap
drbd_may_finish_epoch() and drbd_free_page_chain() in e_end_block().
Please try this and send it as a patch if it solves your problem.

By the way, this patch doesn't compile due to a mismatched brace.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
