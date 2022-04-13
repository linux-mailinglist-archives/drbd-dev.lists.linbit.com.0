Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6454FF664
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Apr 2022 14:06:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF251420332;
	Wed, 13 Apr 2022 14:06:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 365 seconds by postgrey-1.31 at mail19;
	Wed, 13 Apr 2022 14:06:19 CEST
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net
	[83.223.78.233])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 44D0E4201FB
	for <drbd-dev@lists.linbit.com>; Wed, 13 Apr 2022 14:06:19 +0200 (CEST)
Received: from h41.hostsharing.net (h41.hostsharing.net [83.223.95.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 7134910189E11
	for <drbd-dev@lists.linbit.com>; Wed, 13 Apr 2022 14:00:14 +0200 (CEST)
Received: from obelix.kley.hierweck.de
	(ip-109-090-207-145.um36.pools.vodafone-ip.de [109.90.207.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
	SHA256) (No client certificate requested)
	by h41.hostsharing.net (Postfix) with ESMTPSA id 5FC90433C6
	for <drbd-dev@lists.linbit.com>; Wed, 13 Apr 2022 14:00:14 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by obelix.kley.hierweck.de (Postfix) with ESMTP id D15603B01CF8
	for <drbd-dev@lists.linbit.com>; Wed, 13 Apr 2022 14:00:13 +0200 (CEST)
Message-ID: <2eb1c80a-676a-1c48-7dc4-2c057cfbd848@hierweck.de>
Date: Wed, 13 Apr 2022 14:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.6.2
Content-Language: en-US
To: drbd-dev@lists.linbit.com
References: <a630a6ec-422d-3799-7781-3469fc698ba7@hierweck.de>
	<CADGDV=UQO9MuHpo=h5R4b+8B=BWY-nPeaf1OZbSo765+4rP+sQ@mail.gmail.com>
From: Michael Hierweck <michael@hierweck.de>
In-Reply-To: <CADGDV=UQO9MuHpo=h5R4b+8B=BWY-nPeaf1OZbSo765+4rP+sQ@mail.gmail.com>
Subject: Re: [Drbd-dev]
 =?utf-8?q?DRBD_Lockups=3A_We_did_not_send_a_P=5FBARRIE?=
 =?utf-8?q?R_=E2=80=93_drbd_kernel_thread_blocked?=
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hello Phil,

On 13.04.22 09:20, Philipp Reisner wrote:
> 
> Unfortunately, it is hard to tell what went wrong from the log
> messages. In recent development (after 9.1.6 before 9.1.7-rc.2) there
> were some fixes that cured some bugs that led to the same symptom
> (=log messages).
> I do not know if that also eliminated what you see. My asks are:
>   * Please verify with 9.1.7-rc.2 if you can reproduce the issue.
>   * If yes, try, step by step to create the minimal reproducing
> scenario and send it to us in a way that we can reproduce it.

Thanks for your reply.

We will test this and report. Luckily our setup allows to reproduce the bug with little effort.

I would like to mention that the bug occurred before and after #7f599c2 was merged.

Best regards,

Michael



_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
