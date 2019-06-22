Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5C4F21E
	for <lists+drbd-dev@lfdr.de>; Sat, 22 Jun 2019 02:04:07 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 833F21028A78;
	Sat, 22 Jun 2019 02:04:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id E4E2B1028A71
	for <drbd-dev@lists.linbit.com>; Sat, 22 Jun 2019 02:04:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id 39129A0692
	for <drbd-dev@lists.linbit.com>; Sat, 22 Jun 2019 00:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DpAoFq7Speoh for <drbd-dev@lists.linbit.com>;
	Sat, 22 Jun 2019 00:04:01 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 8EB76A067D
	for <drbd-dev@lists.linbit.com>; Sat, 22 Jun 2019 00:04:01 +0000 (UTC)
Date: Sat, 22 Jun 2019 00:03:55 +0000 (UTC)
From: Eric Wheeler <drbd-dev@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: drbd-dev@lists.linbit.com
Message-ID: <alpine.LRH.2.11.1906210638010.3326@mx.ewheeler.net>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
Subject: [Drbd-dev] Checksum based resync block size
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hello all,

Can someone help explain how checksum-based sync and verify are 
implemented in the sender and receive side?  It looks like the hashes are 
per-sector (looking at read_for_csum?) and I am interested in making the 
csum chunk size configurable, or at least hack in some test code to see if 
it would provide a performance benefit to csum multiple sectors.

I'm also trying to understand what iterates over the lldev and understand 
where the csum takes place foreach chunk of data.

Any direction would be helpful.  Thank you.

--
Eric Wheeler
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
