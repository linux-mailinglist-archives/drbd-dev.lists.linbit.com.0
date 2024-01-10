Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 641BE829987
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jan 2024 12:45:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2FAEB420139;
	Wed, 10 Jan 2024 12:45:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 311 seconds by postgrey-1.31 at mail19;
	Wed, 10 Jan 2024 12:45:37 CET
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F3EE420139
	for <drbd-dev@lists.linbit.com>; Wed, 10 Jan 2024 12:45:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1704887137; x=1705491937; i=markus.elfring@web.de;
	bh=P0anna4JWOhnimdjUk13w2sXj1/SrIEjxwjDEaNWyfs=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	In-Reply-To;
	b=wx76Tz9aciyFKAwjaadousxWfnjr59kfoFanC7NIZkwLPEZQQ6uPKghlJXi+yMDQ
	1o9ijLild9wL8THbJx7kr5Smv8f7rM4+Dgwd1Jl40emUa7BIrEJUnEAdtMKJiwvlD
	4w+lz3ZNjMwBNHpeiWQuDH/dyrQYIuxHY1xnGPzWS/RtyVfbAPW+bvJ87nlVT1vZ9
	HuRAE6+3kAosP0gkZYurHaaAcfTvuavKfvBfoZF9PpC/Zg2LpYfXnNPUfhBTrq9Za
	jOv1Ey0rURW1G9ZaVw/KGEl5L2qHMLvIsu6XevsDia/kJkcVChfVhq919nWCaLWyL
	PsHHqE/1rJCbuEjvRA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb105
	[213.165.67.124]) with ESMTPSA (Nemesis) id 1McZnj-1qlBWG2STd-00cvO5;
	Wed, 10 Jan 2024 12:40:25 +0100
Message-ID: <71cd2c67-99a4-4173-8f0f-065fd864f8ba@web.de>
Date: Wed, 10 Jan 2024 12:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
	=?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>
References: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
	<33226beb-4fe2-3da5-5d69-a33e683dec57@web.de>
In-Reply-To: <33226beb-4fe2-3da5-5d69-a33e683dec57@web.de>
X-Provags-ID: V03:K1:FvN7dPgcDHXfSNpzcQS0P6dIUa4iuJ1O5Ux14a/Vy6slkXstFSm
	i2fGgA9VGN+mDIJF7soCccsr07aCTRytpI+mT+ILc4ZFWP5nL0tdRHb3Ul2KW2Zd+hfjOtH
	IpDqfB15AUfmtd/igJQglrWxLmNEQLvnSGUJqJHzWA7Mfb24Rbio61GqZpatuYycuhXdXSA
	XTbqo72jfhnC/+4BCZppQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9om2NkfPBe0=;v8+P5IJo5d2mxKwHdhhAlskGVIL
	6PElHEpKyV1e+fjYhaZr5UGyZlZjwe676xFdIcbc/N0Ut8ebYltSv5tL3PZAnoS34ogA62Q3w
	LIl2xOEfgLYNu0qYM+JDBlsxg7dlsb+9PnWMLJ7r7FcznQPJvzXLpBWPOPMkVs1GAlEciPiY7
	pMBr2O+FuSydUpqKJ8cUeQ2OGPVb6qDlx/W4qJxzn1uQhUTfBQqgLGGDLsngDnysWkPg/Nh5j
	fUOAgTrm/YV7NsCNhkD3FzBknu1eytbD1oEY/JTHSgYeJZ0FfWMLhOEQSH61XVPUy4Poxbfv5
	fAdE+mHPiJme+52HoI+O6gRicGuc1VY9+965o8PlyNwWVFgQd4BsZxVdRfBzgzf13uNORfYO/
	7WCAx6bqMLADZN4hPPGQJYXADaM7CvUrXQjryac3Mz7XXg22Ayn8PvXBY+L5bleCGHhXjUi25
	GK+FjRJWZSJ2BVSkisxbWsbUFMjEwVyjqgdSuk5Vj9FVwH3n1PzdkVsEkrdB0Y4BiA2sgmUHm
	TMBjOiksGkbwwLNW/sKHAuiOFyBBNJLRkLOaiTZU/4904z0TJnrYBqIjNdSXOFdfWqBYFseYr
	Fur9+ov6nX7hCENtdYeY89ejBRP86WMrtrWUjYtQcdfnypWKsuHuqfrV5ADb4JwL8TeAWRbXj
	hlR77ganHe9/MxNcw4EpcwvZT3GNbToLgv9B+rnjkx2NXeKMAC23qq6xeFgAIyLBZMCzdKjHt
	rlVY8QZmacXoR16e1M991dDgVHSTJ+Whk7HZYCqWoRKt6RZGDj3FW16Wuu5Ei3ISM0k6btMPy
	V08gYyIH9LKdLhECnNlH+Ej8rnB2zaxJOqY1alNlwR9KY5GhjCV6huEuziDs/ZgC8CS9coi3X
	AK1DIHT2smE/WXzNy/iNENLRMIUSYMziAl0soPmbAATG1PkKUSRRHyRTeFGYCD7wsIigCOytW
	Z9mNUA==
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: Re: [Drbd-dev] [PATCH 0/3] lru_cache: Adjustments for lc_create()
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

> Date: Wed, 29 Mar 2023 15:30:23 +0200
>
> Some update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (3):
>   Return directly after a failed kzalloc()
>   Improve two size determinations
>   Improve exception handling
>
>  lib/lru_cache.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)


Is this patch series still in review queues?

See also:
https://lore.kernel.org/cocci/33226beb-4fe2-3da5-5d69-a33e683dec57@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2023-03/msg00110.html

Regards,
Markus
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
