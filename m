Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B95913F1
	for <lists+drbd-dev@lfdr.de>; Fri, 12 Aug 2022 18:34:38 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A024A420372;
	Fri, 12 Aug 2022 18:34:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70438420170
	for <drbd-dev@lists.linbit.com>; Fri, 12 Aug 2022 18:34:35 +0200 (CEST)
Received: by mail-ed1-f41.google.com with SMTP id z2so1996867edc.1
	for <drbd-dev@lists.linbit.com>; Fri, 12 Aug 2022 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc;
	bh=HZs3rYIch5IH0/Do58PlCetd+P/YyJ2L3UUJqLuyd7Q=;
	b=tYR7UBUyByZeA+PRl7GkQJJSa4V90/ukzKBf18ZJoOqeP63e7KMB9pkeTw067nw5jr
	HBAzFU+e9dGbeXomhL7dkHqchVO558zu8F7n4X5vstJ3rEQQj2Cxvbwma6CUmeP0633B
	RWtKQS8tZ+TcMNFUlxtLozP+Fsr6n8yGauJnD9v7EXRJ7j9geN/5Zaor6i4n2IHVpQbU
	2xlvbvU5ZJ6kHUm/gVOjHZz7nzjKAGsYv5AKfPnyD0L59OsYgaM98B6pYbplUvVqelJ8
	tL93cF38ksqJh2VQswhsmkr1u5diOyPv5U5P558GuRBQitYbvVm/0SkPWSjhjxbHE9US
	+IjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc;
	bh=HZs3rYIch5IH0/Do58PlCetd+P/YyJ2L3UUJqLuyd7Q=;
	b=gKNrFQC9RUlejbNnXCGKNrbR6MpyrFWsVWx2UHWxsT/00Qime85ymelofuIVuA/GBB
	QmMb5KKp2lxR5dBPd3Ol8CzmUXjSbn79BPOlneAfrxh+5fbUEcRllGUMXmQKS2c8hXe4
	VFo6959zDWFc2EO2jlDRW55GNinP2KWis625RPAq6lzzccf2+Ifix838U2I05zuR6nZr
	eJgiwxQa+Uy40egSVvdWvvllGUEyRto1y7LfUCDOH0kkOwljXv2Zv0fZyG0Lz2HDcneK
	2Ji98ByJDPiI8yTbEgQa3tzH3Jy89K71dwmK7g3rNgbCGNGQfQwhxxRmnnJtuPXUCsJ9
	Gsqw==
X-Gm-Message-State: ACgBeo28VgKkH2n5v8BdmXJjHYCnrhEB0YY5jYcx+3NKnIcg/p8PDFzY
	v+O9WaovqWE7iOnRV6gy42oWUQZkt1pe1qKJbrVs63t3
X-Google-Smtp-Source: AA6agR6NqO+U8v6Ob68OLQFSkpB1Bwxqpm7mATwTANDvRYbvO/53i7P6gzXR9q4CbL11QwhG+nSSHNBElapEbabpHcg=
X-Received: by 2002:a05:6402:3892:b0:43b:d872:a66 with SMTP id
	fd18-20020a056402389200b0043bd8720a66mr4306201edb.139.1660322014911;
	Fri, 12 Aug 2022 09:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220810115748.1484527-1-rui.xu@easystack.cn>
In-Reply-To: <20220810115748.1484527-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 12 Aug 2022 18:33:24 +0200
Message-ID: <CAGNP_+VqDKWbr=-+vg6wzMZjoSdicjeQtw4-NsHwBgSvhapwkw@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: retry the IO when connection lost
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

> And it's simpler than the current mechanism.

It certainly is.

Unfortunately it breaks other things. I will not comment on details of
the code, but rather on the core architectural concern.

I believe requests that were not yet completed could be retried as you propose.

The difficult requests are those that are completed, but for which no
barrier ack has yet been received. These requests may not yet have
been persisted on the peer, even with protocol C. Only once the
barrier ack has been received do we know that the write has been
persisted. Until then the peer might lose the write if it crashes.

Until we regain quorum, we do not know what to do with such requests.
There are 2 possibilities:
a) It may be that only a network outage occurred. In this case we want
to resume without a resync.
b) It may be that the peer crashed. In this case we need to perform a
resync including the blocks corresponding to these requests.

We keep the requests in the transfer log until we regain quorum, so
that we know whether we are in situation a) or b).

Your patch assumes that "OK" requests can be assumed to have been
persisted on the peer:
+ } else if (req->net_rq_state[idx] & RQ_NET_OK) {
+ goto barrier_acked;

That is, the patch assumes that situation a) will occur. If b)
actually occurred, then the necessary blocks will not be resynced and
this could cause data corruption.

I am very ready to believe that there is a simpler way of dealing with
suspended requests, but it must handle these different possibilities.

> My test also meet a problem introduced by commit 33600a4632f2.
> I have three nodes running with drbd9.1(node-1, node-2 and node-3),
> node-1 is primary and other nodes are secondary. Both quorum and
> quorum-minimum-redundancy are set to 2.

Indeed, the quorum-minimum-redundancy implementation is now stricter.
Previously it allowed requests to complete which should not have been
allowed to. The stricter implementation introduces some tricky corner
cases which make it hard to use. I recommend that you do not use it
unless you are really certain that you need it. There may have been
some confusing recommendations in the past. I recommended it for a
while. Now it is not recommended to use quorum-minimum-redundancy in
general.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
