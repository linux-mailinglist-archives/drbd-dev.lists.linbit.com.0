Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 020104B7B4A
	for <lists+drbd-dev@lfdr.de>; Wed, 16 Feb 2022 00:40:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CEFCB4205E3;
	Wed, 16 Feb 2022 00:40:18 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 472 seconds by postgrey-1.31 at mail19;
	Wed, 16 Feb 2022 00:40:16 CET
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E24242036B
	for <drbd-dev@lists.linbit.com>; Wed, 16 Feb 2022 00:40:16 +0100 (CET)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 86BE835F;
	Tue, 15 Feb 2022 23:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 86BE835F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1644967943; bh=7DxpN4wzbn4CODMyzgxFFGlGqYFqY22/e9LTczIG2OU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TK7Q9BwRKshNVecx6N+fGxQUGPpzAzKMsPjmyXQdznW9W9hSUdz282IGXvSdnXJx+
	3AILEsoCpm9x1dkVxbOb4a6/4BRj6UJ/I/WiM1AK0PvcRWaJrcLVKkBzpPCS2O8CxX
	K0fwE4HiH0MFvPNF058/462Q2+Mfpk1yu+KIaiaeaIZpIE6JkEZpEXjwf2A1FLbEui
	Jku8lZr6OD9am2oLSW/psVj2/3Gwg5BQdZ5hokQ5mq7rOJnyINA777TQS+vji8GLYD
	Jj19Wtz/KFHgAQsfA62b1svcVgdd8anpml/IN1AY3Qg24gg+s9o2w4Vj3uSKfXPKOq
	yWGKo1hzvckHw==
From: Jonathan Corbet <corbet@lwn.net>
To: Ethan Dye <mrtops03@gmail.com>
In-Reply-To: <20220207235442.95090-1-mrtops03@gmail.com>
References: <20220207235442.95090-1-mrtops03@gmail.com>
Date: Tue, 15 Feb 2022 16:32:23 -0700
Message-ID: <874k4z7lko.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: Nitin@linbit.com, linux-doc@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Gupta <ngupta@vflare.org>, Ethan Dye <mrtops03@gmail.com>
Subject: Re: [Drbd-dev] [PATCH] block/zram: Fix wording in optional feature
	docs
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

Ethan Dye <mrtops03@gmail.com> writes:

> This fixes some simple grammar errors in the documentation for zram,
> specifically errors in the optional featue section of the zram
> documentation.
>
> Signed-off-by: Ethan Dye <mrtops03@gmail.com>
> ---
>  Documentation/admin-guide/blockdev/zram.rst | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

This document could use a lot more help than that, but this is a
start...applied, thanks.

jon
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
