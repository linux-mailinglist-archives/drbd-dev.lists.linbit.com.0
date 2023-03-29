Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ADE6CDAFC
	for <lists+drbd-dev@lfdr.de>; Wed, 29 Mar 2023 15:37:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1784742066F;
	Wed, 29 Mar 2023 15:37:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mout.web.de (mout.web.de [212.227.15.14])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8F2CC4202D0
	for <drbd-dev@lists.linbit.com>; Wed, 29 Mar 2023 15:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1680097020; i=markus.elfring@web.de;
	bh=uitMQdcEuLziYi5MTWu1izvpI93iiFxtgonP2kypPMk=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=PLO2fA6745Y2/BP54picWIsjH2oNFIZ7z37I2o165maPuURCdl6r2NEKm3wiMGQM7
	8WMsFS0DPtyZ+nAyMeS39WtZ7+kp5GFW/DYiEBFsg6qwai0xx9pmKBPOY9H6kTQS3+
	oaRB8GqwbUtmw9sN1L42siQVZ6dsAt3qE6n0mfujFS5zjZEJtpxIDb6wHg4IHG7aXx
	DXME5m1EA2WGE93KqRsCr5xRXOWVAT0eicVJSXDp0+vRvWESbuAOquo9UZAMTU1QVQ
	c0THxs2KSjf54UwH3C0Nb5CQ2CFTLW64PO8DAa9N6S7G5T1UicWFT3VCehJRB2At1Y
	CtA05hB4KuN4g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
	[213.165.67.108]) with ESMTPSA (Nemesis) id 1MCGWc-1pZEFC254c-009OQL;
	Wed, 29 Mar 2023 15:37:00 +0200
Message-ID: <33226beb-4fe2-3da5-5d69-a33e683dec57@web.de>
Date: Wed, 29 Mar 2023 15:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.0
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
	=?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>
References: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
In-Reply-To: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
X-Provags-ID: V03:K1:nyO7Nh/CEb9UXMgsFSDVpko2Eg7SYs8n0tlLs79yugOt3DIGLvs
	Xo2QEc88mtQj+ENImXjc2qBJkcN2DeVH1iZ0TprusKYoMR2oqdR5d/uEQEahiylrKvFz4iE
	vrSSmrC0lIYYXMbnYHhAgHm9o54ne7hJpOMrdPn/bVDC/GLjl4OVL1QCOXtpBXYy2c/fiJ5
	RyLdJAbhXsvd8PqLpB69A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XlK6+JoBPsQ=;ZN2aXo8qL5ywfvX1b1offvkATJh
	s5pxNpmsaXIm+0VYQ2Gx0OV9/ZZe62d5uNOB+kFM96+4lkxpjHQ5Hpt08VSW8aezXK59vBdmz
	EcfQgSQ3buO7nn3L+rYLBvpIQcHOhPTAq67rECEPgiK82eC45Dv18qABNQ6A7cl2dWzuUMLO5
	u9utYb/DFbM3ER8WUu6qncAHwJKhkWCk2CtZ+YQwZ45lAFkBynz+kFGukC9pBRCHfuRXJCpXp
	+IcCc08DKG1sQlUB+fi4TsHc7H7H/nHHjPIsHgqzc0obajRInhVpok2mp3OO0MBCHRWuxiqQG
	MXWaVZkVQ5XE4wY8WVU1Y8tWGs9ucArUDOqHxI9jHym3pgq/SRb9NDcT1knXp8hkZAXxdyYVc
	1EJtPZ36VRvXSrxHsMYNG7rSgORPMtvNkQQ4EC+E9PoA3IRuRfFrqpS8w3wKa/Bst8sRxAW8/
	TNuIpBt/GcqoTbV5k2hKosiynYMbJwasol7JUbdGTkCxTjeNsV1ThC/X0/J8a1VW8xp9NjBLg
	nn8d5XuQi1VBLg8wAjwGrSimGyx0IbeZKq/j76d/RO8kQfCOfxctXL72ICXQwn2AO2IrdycN+
	DZDO4tNmLUxze6t4lS4TtZKagtZLbtvOfPeNP8+/WyX6hWZzw4wfPhRBeaBhhCenNZfnjJcOw
	dS6DRGoWAZ+y0IcqwVp3wj1pySK2jGgSAlppK4AihkukEG5/JuAPgaaxQ4p7ZXPeEVAc5nH9w
	Ng5STCT7GB8DbKXY8phq3XSNAp2EtVkROdVO1Fw566BYeG2eXy6+0QSpRDJKQ0MO92R3P/iOk
	3oyEZak+S89VRNtm3j70+K49n70rTq/vJPp3arY2iMvg9jbJ7tx+LtMmbXRYQOklkAVVesR6T
	hzuhamj92b3Vye559O8ox2EUY/ZxBEyaB79b8CCh/LMC+kmh7q21J9g1B
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: [Drbd-dev] [PATCH 0/3] lru_cache: Adjustments for lc_create()
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

Date: Wed, 29 Mar 2023 15:30:23 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Return directly after a failed kzalloc()
  Improve two size determinations
  Improve exception handling

 lib/lru_cache.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

--
2.40.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
