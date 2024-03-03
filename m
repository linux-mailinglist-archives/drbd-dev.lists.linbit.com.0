Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id A647186F5C2
	for <lists+drbd-dev@lfdr.de>; Sun,  3 Mar 2024 16:14:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 27CB042064F;
	Sun,  3 Mar 2024 16:14:47 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 32B0042062D
	for <drbd-dev@lists.linbit.com>; Sun,  3 Mar 2024 16:14:40 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 976AB68D09; Sun,  3 Mar 2024 16:14:38 +0100 (CET)
Date: Sun, 3 Mar 2024 16:14:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: drbd queue limits conversion ping
Message-ID: <20240303151438.GB27512@lst.de>
References: <20240226103004.281412-1-hch@lst.de>
	<20240226103004.281412-11-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226103004.281412-11-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linbit.com
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

Dear RDBD maintainers,

can you start the review on the drbd queue limits conversion?
This is the only big chunk of the queue limits conversion we haven't
even started reviews on, and the merge window is closing soon.

