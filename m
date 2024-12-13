Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB719F11DB
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Dec 2024 17:14:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 573C016B818;
	Fri, 13 Dec 2024 17:13:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 387 seconds by postgrey-1.31 at mail19;
	Fri, 13 Dec 2024 17:13:53 CET
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 121B0160645
	for <drbd-dev@lists.linbit.com>; Fri, 13 Dec 2024 17:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C4735403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734106045; bh=CDix5sdvn7zgkBy6uTqiRTOx3MpP5A+4PCqiNIfm0E8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qBqPLD7OC43Y6k5KkGaXD0o6amRH2ohPU4rg4ohjiIhp+S/4ktvRFvWjZwMmB82i4
	beT5BZW6mG1peaLm9YdkVSOYTgsjMphRVpJ0r7mam5wXD0lKrAyYqrH7ybhNRxT/I+
	DhZJr52G87B/P7A7N6OkIfSRyYCWgBG1+/msPG4bGrNgV+l+DAHmketzV2fmN7dqLA
	1q8kRUQyrSFTJFo6sWTtkm1vfMLscuCapbgnVbdHu13BWZ5PZA9roA5Uxwfs/F1e9V
	GIS0d6crn9nl3EYR3i9n/2TXvtn5G6knmxRTczc2322pjGs1P1EqT4xVtg3cLstPfv
	DKsFWP9EsShUg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C4735403FA;
	Fri, 13 Dec 2024 16:07:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Saru2003 <sarvesh20123@gmail.com>, minchan@kernel.org,
	senozhatsky@chromium.org
Subject: Re: [PATCH v2] Documentation: zram: fix dictionary spelling
In-Reply-To: <20241125165122.17521-1-sarvesh20123@gmail.com>
References: <20241125024927.GA440697@google.com>
	<20241125165122.17521-1-sarvesh20123@gmail.com>
Date: Fri, 13 Dec 2024 09:07:23 -0700
Message-ID: <87r06bwoqs.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-doc@vger.kernel.org, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, terrelln@fb.com,
	Saru2003 <sarvesh20123@gmail.com>, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Saru2003 <sarvesh20123@gmail.com> writes:

> Fixes a typo in the ZRAM documentation where 'dictioary' was
> misspelled. Corrected it to 'dictionary' in the example usage
> of 'algorithm_params'.
>
> Signed-off-by: Sarveshwaar SS <sarvesh20123@gmail.com>
> ---
>  Documentation/admin-guide/blockdev/zram.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
