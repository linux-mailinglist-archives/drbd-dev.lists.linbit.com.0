Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 380336465EA
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Dec 2022 01:36:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 935DB42178C;
	Thu,  8 Dec 2022 01:36:07 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A936F42178C
	for <drbd-dev@lists.linbit.com>;
	Thu,  8 Dec 2022 01:36:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8F8D61D04;
	Thu,  8 Dec 2022 00:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AF6C433C1;
	Thu,  8 Dec 2022 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670459763;
	bh=8EqImzFDFK7SCDTb85EZXzmxEthwAPbCP4u3wA+fVVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qj8Ws3/FmYV9fzKhoMQtZHpgfiJPp8CSx2k3z/uJYemAhWfiuguoZUtJhnQHpjxTN
	kAOwhDMb+3g2v60wt+E/ozBrWcN+iAy1T7zW4jScRe1kZMeAY51aT3uLWqyTEkLCIg
	wObJgbcpW/t56PgtA6J40EnoAILsAVmP7mtN5dzBthLb32oQ2MoczwQgGWI2PHzxMc
	XfgcYqvOB6UfnujKHBnXLFPww/KeIdmPdPuRzD7XPsKoRg5Az8bfQVGpEDdkDFadoC
	m/2roapq2yF9V3+XdCIyDjtcP348AvcPbX+5jc8CCN9CbJ7HEmWCEySFVIoXuiAH2L
	ee3NvjHxGvObw==
Date: Thu, 8 Dec 2022 00:35:55 +0000
From: Keith Busch <kbusch@kernel.org>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Message-ID: <Y5Exa1TV/2VLcEWR@kbusch-mbp>
References: <20221207223204.22459-1-gulam.mohamed@oracle.com>
	<abaa2003-4ddf-5ef9-d62c-1708a214609d@kernel.dk>
	<09be5cbe-9251-d28c-e91a-3f2e5e9e99f2@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09be5cbe-9251-d28c-e91a-3f2e5e9e99f2@nvidia.com>
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"song@kernel.org" <song@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"ira.weiny@intel.com" <ira.weiny@intel.com>,
	"agk@redhat.com" <agk@redhat.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"dave.jiang@intel.com" <dave.jiang@intel.com>,
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"joe.jin@oracle.com" <joe.jin@oracle.com>,
	"kent.overstreet@gmail.com" <kent.overstreet@gmail.com>,
	"ngupta@vflare.org" <ngupta@vflare.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Gulam Mohamed <gulam.mohamed@oracle.com>,
	"snitzer@kernel.org" <snitzer@kernel.org>,
	"colyli@suse.de" <colyli@suse.de>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"dan.j.williams@intel.com" <dan.j.williams@intel.com>,
	Jens Axboe <axboe@kernel.dk>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"junxiao.bi@oracle.com" <junxiao.bi@oracle.com>,
	"minchan@kernel.org" <minchan@kernel.org>,
	"lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>
Subject: Re: [Drbd-dev] [RFC for-6.2/block V2] block: Change the granularity
 of io ticks from ms to ns
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

On Wed, Dec 07, 2022 at 11:17:12PM +0000, Chaitanya Kulkarni wrote:
> On 12/7/22 15:08, Jens Axboe wrote:
> > 
> > My default peak testing runs at 122M IOPS. That's also the peak IOPS of
> > the devices combined, and with iostats disabled. If I enabled iostats,
> > then the performance drops to 112M IOPS. It's no longer device limited,
> > that's a drop of about 8.2%.
> > 
> 
> Wow, clearly not acceptable that's exactly I asked for perf
> numbers :).

For the record, we did say per-io ktime_get() has a measurable
performance harm and should be aggregated.

  https://www.spinics.net/lists/linux-block/msg89937.html
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
