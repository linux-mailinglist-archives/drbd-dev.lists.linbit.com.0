Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179A5EF24A
	for <lists+drbd-dev@lfdr.de>; Thu, 29 Sep 2022 11:39:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BAACD4203D5;
	Thu, 29 Sep 2022 11:39:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 028F8420175
	for <drbd-dev@lists.linbit.com>; Thu, 29 Sep 2022 11:39:57 +0200 (CEST)
Received: by mail-ed1-f52.google.com with SMTP id y100so685109ede.6
	for <drbd-dev@lists.linbit.com>; Thu, 29 Sep 2022 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date;
	bh=Z25XMcQT9UMS6U5UGo589F/7ZcQSNgGwsHBfv7OVdRE=;
	b=q4r+OUuw2J2dScfCfRRGRMsg5CPy8dXLkLzoe7cmhjiUhe7eLOXeetqOvZsuGhrI7y
	4Rr1b/JQUVnJNNH9UVOQRwbRbzFMTQdVEuiNjRIKOOFsp9J1A9gA22ag7tuSK5bgRNhN
	QV4RIIsXRXPii6ZrMVEUB2TG0dycOga5hti+a9MzCu97iErEO+8t3hVzI50gFqbQLJYa
	GJgPqz6929T5epwoK3HGgYUmDw2cHD/StoCxxFcfQPeMwNyIqGReOVxRaEFQK8Yj2Yx3
	PqqgIHM7IAQShhi5bw+VnVXjTkjMZpn0I0PVOPOxGr1/JxuMTevE3/9nyr7MY+95zJT/
	3cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date;
	bh=Z25XMcQT9UMS6U5UGo589F/7ZcQSNgGwsHBfv7OVdRE=;
	b=z/UncqVerJAdyE9V2/xIEYM/nMvX5v+RGVkGmdoyW7vsss3MGAgetLLjNNWidj228t
	HU4XpY03iVwgdKF6A26QAvhF7SXxx8qMSaaYehiJ8Le28FbH+zYopVZZ5DZt7BJ241uf
	YKZypc5ihNyxMNQoMdt7lpGQe1YciUkC6I69FSYkLAsqKoCXEbdiW6xUNgl13hmgY0Xz
	PXUZINWkEXSH0KBV8htTcFB3v72v4BiQRRAO38noxDNqEAaINpMavOrO+Cf703q4XH2P
	TOtabQAgJ02AJS+g24ySdJ1eFUTrjV4+9yM8Pr5PL3QaQzeanAdGMhcLjDh3NSBnCr4c
	LpSg==
X-Gm-Message-State: ACrzQf0M87B32pCoaodFTak0c2XlXeAgFaOLu3NZlLa4R/iUeHKSq33w
	xrPdSFC/HNjMjqmCuMqkU/u+wMpBk9B6tJiIsiJL1nHz
X-Google-Smtp-Source: AMsMyM5KXDt+n+5LbJ2vwZlZVL+9KkAIFu5z3GZ+NSXJYhq7CG1Am8Eg7j8ZMDpktgQh3YNrEqlYXTbSCMlXqI+TyIU=
X-Received: by 2002:a05:6402:c95:b0:457:37d4:c4c5 with SMTP id
	cm21-20020a0564020c9500b0045737d4c4c5mr2398150edb.267.1664444397300;
	Thu, 29 Sep 2022 02:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220921090710.2238953-1-rui.xu@easystack.cn>
In-Reply-To: <20220921090710.2238953-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 29 Sep 2022 11:39:46 +0200
Message-ID: <CAGNP_+Xh9e8hA+B73Li4P-kZ6KvcazAQkwCpfAzDCpR-7HzDBA@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: philipp.reisner@linbit.com, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: fix a bug of got_peer_ack
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

> Consider a scenrio that io is ongoing and the backing disk of
> secondary drbd suddenly broken. Some requset from primary node
> will not be processed in receive_Data since there is no ldev.
> And primary node will send peer_ack to secondary node for those
> requsets, but the secondary node will not find these requests in
> got_peer_ack.
>
> The first problem caused by this bug is that the two nodes will be
> disconnected, and the second problem is that some peer requests
> can't be destroyed.

I can confirm this issue. Thanks for reporting it.

> Fix it by find the last peer request on peer_requests list and then
> the remaining requests on the list will be destroyed.

I believe this is a valid solution. It is missing the case where
another peer ack is sent afterwards too, so that got_peer_ack() is
called with connection->peer_requests empty. But don't worry about
that for now.

The question is - do we need to send peer acks to peers that responded
with P_NEG_ACK at all? At the point when the write fails on the
secondary, we could set the bitmap bits and free the request. Then we
don't need the peer-ack from the primary. This may lead to a simpler
and more robust solution. I'll try it.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
