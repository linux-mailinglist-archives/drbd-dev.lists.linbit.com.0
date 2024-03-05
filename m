Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 6641587205F
	for <lists+drbd-dev@lfdr.de>; Tue,  5 Mar 2024 14:38:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 00D8D420319;
	Tue,  5 Mar 2024 14:38:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5D8024201A7
	for <drbd-dev@lists.linbit.com>; Tue,  5 Mar 2024 14:38:15 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 546B468D07; Tue,  5 Mar 2024 14:38:13 +0100 (CET)
Date: Tue, 5 Mar 2024 14:38:12 +0100
From: Christoph Hellwig <hch@lst.de>
To: Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: drbd queue limits conversion ping
Message-ID: <20240305133812.GA1345@lst.de>
References: <20240226103004.281412-1-hch@lst.de>
	<20240226103004.281412-11-hch@lst.de>
	<20240303151438.GB27512@lst.de>
	<CADGDV=XqJ_3biGx-rX0jMMue4-dTg=J8NjyHOU-Ufonv4QiJ-A@mail.gmail.com>
	<CADGDV=WJWZHj89rebvNJ2BOhuqG=_Nr5S3+QXp6LTEGGKyzuKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADGDV=WJWZHj89rebvNJ2BOhuqG=_Nr5S3+QXp6LTEGGKyzuKQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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

On Tue, Mar 05, 2024 at 10:39:55AM +0100, Philipp Reisner wrote:
> Christoph,
> 
> we are fine with the queue limit conversion as you did it. Lars and I
> reviewed it, and Christoph ran the tests. All fine.

Can you provide formal Reviewed-by and Tested-by tags?  I'll resend the
patches standalone, maybe reply to those.

