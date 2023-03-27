Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640A6CABF7
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Mar 2023 19:39:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3EF8420966;
	Mon, 27 Mar 2023 19:39:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 455 seconds by postgrey-1.31 at mail19;
	Mon, 27 Mar 2023 19:39:18 CEST
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 66352420312
	for <drbd-dev@lists.linbit.com>; Mon, 27 Mar 2023 19:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679938757; i=markus.elfring@web.de;
	bh=H1MPxHXviBTm9+1/MMmwrhPapFh7IkMuatxpI0kIQSY=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=s4SGUM8uJUY/k12Prj7zbP93JgNFZvzJIedJErY+nX2w9O3IJSPKrHyQNHG6HBfKx
	dDuc0aKi/HMqERQwsn4H9NkKIzCHrKNAlLBhUdGIF8CYvUQYhjOig7bAug6J8aBU8g
	GRb9FBuji/Blk5YNv+7nVAITKfILt2nY5FmLlnzO5e8gu7ozugKUf+O51lOwYWSUjF
	q8pAkIfNN5anevMZyqsW4YOSeJBleX7M1V1s36J5r6iENfyqZ/wXq9XW3KXmfR1lkP
	ADOmCTSHcrov/8VpV/9tXZ/rig3Pv78QkSQ0E90WvU3Pg+NW5GEd1Zs7fZg1ARXTdF
	7zrxmyWeQcmuQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.83]) by smtp.web.de (mrweb105
	[213.165.67.124]) with ESMTPSA (Nemesis) id 1MMY1N-1pzl2j3D8x-00JXit;
	Mon, 27 Mar 2023 19:26:34 +0200
Message-ID: <7a6c195f-42df-eef2-e2b7-9f7510dbdf06@web.de>
Date: Mon, 27 Mar 2023 19:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.0
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
	<8d193937-532f-959f-9b84-d911984508aa@web.de>
	<941709b5-d940-42c9-5f31-7ed56e3e6151@web.de>
	<a989f01e-79a9-44a4-3603-ba4eeeb86dea@linbit.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a989f01e-79a9-44a4-3603-ba4eeeb86dea@linbit.com>
X-Provags-ID: V03:K1:HvVD7nrmswxX08XbtKylMJjqi0QvPqsyuGw6/cRRS/7oMNVDGtv
	COamcrycoTnxMHCk9HIdloLK5aXXOIswv9ji2D+iIHZ2wfdijqZk/fYf81nJyIbaRL1WSLV
	HqX+uvFSBZ3xXOurC+BXiKxt0ivwwcLDQh3k6lGHuA70GV/iwt/7yZxYxrjpdWe/stFpFn5
	HvZAkevNMkFb29re19ZUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lee87RI8Bzc=;UVIroq5DDGwwt5flenKzg5yguii
	pL6Xxqep09EDHZeuPDmqOkg1nBEIpiQCLXR8VW+dnI8oIpxDBFow0ryo+dMNvqq3hX+r54Uas
	A/dTD36AB/orF7/tghrNBkoqwbW7eze7TuHnRHL3E8Gfyk02AYOqazOmtPfOO/euJ1kf/nq60
	a/Wy9wAqje3pnOUbgr1SQ3bVtoYqp7o2K5Kdfn82sWyeTpbFxlVjgLXdsFUQu9TbLWCqKBmrE
	Ica1i1WLTYvMgIl14AFheLsjmJD4ueMZYwMRLhVhThmu4YpLfQ/S7O5JVpR2dcRE1vlKGBHEg
	dAsBOBdcvf2Wfzv5JIB747F7FYCJuu+h5NUzouUyVCqQmZSBdCHmNwpMMecPk8MNavh9Pt2YE
	mnPgswpz0SfCJWO63hLxO1jUh8M9WQqbaEsGo6yZ1q+wCBlKQxsFgRLQU+shTaehESsR8OXwp
	84E2HCoX3meuWPP0/lU1eEj0he1lWBjJTM+2WUNdPbIvfd5qqOisAnzz1iL9sD/0ipw0/9MNJ
	M9iD9lDrgzrewkXZD/kDRmnytap8BM04sydbYGvtXA4ki/UxnHZUR/VcqW87Tgnt+NlZk2ks0
	Pti5LN3ZIywQfVH8pbfJFIidDtVhPDouRxnweO0GcbqPUJLeRedCnHGkorECl6eHX2891vFAB
	rhnYV9i3Of9/qBWGlfqrC/otcb/mTvr/0LcYo9/3G69zr5vUg6YHGsUOMVeXYDRvLUX+TMXl4
	j/bc1EIzxR+BXcwZREV2dIhuVJ+4TXfom6fgWI5CoFFyoL9K/VjmTw/71NnNl0ol2bwpdbxmt
	z4HesHDQQM7VxFwLR5qSujaSyZKgk8OzdUELUNsGkvMoPP5ZDzF0X9BqexkbZyeE9SL5+sUZ/
	NCAmBi65DISDabc1xmyCmYT/V6RGJpfrEFOhWtXJNDP92+Tn+MKiYPv1g
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: Re: [Drbd-dev] drbd: Fix exception handling in
	nla_put_drbd_cfg_context()
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

> Can you identify the issue with the current code and can you explain how
> your patch makes it better?

I propose to avoid a duplicate pointer check also in this function implementation.

Regards,
Markus

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
