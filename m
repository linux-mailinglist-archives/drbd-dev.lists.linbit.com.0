Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA154066F4
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Sep 2021 07:57:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8BCD042060A;
	Fri, 10 Sep 2021 07:57:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 459 seconds by postgrey-1.31 at mail19;
	Fri, 10 Sep 2021 07:57:03 CEST
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 17CB44201F1
	for <drbd-dev@lists.linbit.com>; Fri, 10 Sep 2021 07:57:02 +0200 (CEST)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id CA6FD5600EF;
	Fri, 10 Sep 2021 13:49:20 +0800 (CST)
Message-ID: <APgATADQH09q-D*PRYzV4qoq.3.1631252960808.Hmail.rui.xu@easystack.cn>
To: Joel Colledge <joel.colledge@linbit.com>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
In-Reply-To: <CAGNP_+U3-BZ+9uykZuttOp6+irG15yesyFfDs27kj3M6BJN+1A@mail.gmail.com>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Fri, 10 Sep 2021 13:49:20 +0800 (GMT+08:00)
From: =?UTF-8?B?5b6Q6ZSQ?= <rui.xu@easystack.cn>
Date: Fri, 10 Sep 2021 13:49:20 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRlDTh9WGkNMSUhISUxCGk
	tNVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpITUNMQ0NISkNNTDdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOiscOi86PyozS0IKVj9RKykiAS1PChQKVUhVSk1ISklOSUJNS0JDSVUzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSUpDVUJPVUpKQ1VCS1lXWQgBWUFIS05INwY+
X-HM-Tid: 0a7bce40d63f8c39kuqtca6fd5600ef
Cc: Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?=5BPATCH=5D_drbd=3A_do_not_finish_the_stable?=
	=?utf-8?q?_resync_when_repl_state_is_L=5FPAUSED=5FSYNC=5FT?=
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

Hi Joel,<br/>    Thanks for the reply and sorry for the delay. After some more <br/>investigation, I found the root cause of this problem we met is that <br/>there is a race condition in update_sync_bits() and receive_bitmap().<br/>This race condition will lead the problem I was trying to solve in this <br/>patch above.<br/><br/>We confirmed the race condition existing in upstream and I have sent a <br/>patch for it:<br/>https://lists.linbit.com/pipermail/drbd-dev/2021-September/005840.html<br/><br/>So you can go to review my new patch directly.<br/><br/>Thanks,<br/>Xu
From: Joel Colledge <joel.colledge@linbit.com>
Date: 2021-09-01 16:40:32
To:  Rui Xu <rui.xu@easystack.cn>
Cc:  Philipp Reisner <philipp.reisner@linbit.com>,drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: do not finish the stable resync when repl state is L_PAUSED_SYNC_T

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
