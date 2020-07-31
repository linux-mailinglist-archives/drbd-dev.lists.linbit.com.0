Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783A233F11
	for <lists+drbd-dev@lfdr.de>; Fri, 31 Jul 2020 08:27:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5B05442049A;
	Fri, 31 Jul 2020 08:27:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.prgmr.com (mail.prgmr.com [71.19.149.6])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7CFF2420225
	for <drbd-dev@lists.linbit.com>; Fri, 31 Jul 2020 08:27:04 +0200 (CEST)
Received: from [192.168.1.99] (unknown [99.0.85.144])
	(Authenticated sender: srn)
	by mail.prgmr.com (Postfix) with ESMTPSA id 825BE72008F
	for <drbd-dev@lists.linbit.com>; Fri, 31 Jul 2020 02:27:03 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 825BE72008F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
	s=default; t=1596176823;
	bh=NNWrB3ojWVLqHJgH87QmmyimSOUVLAcR9gWev6e+4VQ=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=LvXutDl1zGKK3MWPQp+z/4kJDrZF5y3vPohqRhjvOZB2CWyOU3kzGKF3+mo5IUH/X
	MWEIpZrWpUbEGWHifCYIQ1Zbyoq8w5k2MaVh+zl/xUWAtp9AWECtsiXTRYbykkR4mF
	kLlUZ0910CjTVNhBpfxQGa7eU7C5J2cACJlFNPxE=
To: drbd-dev@lists.linbit.com
References: <308845ca-17a3-43d0-b7ad-80069d9bc17f@prgmr.com>
	<20200727071658.GH4222@soda.linbit>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <d5620f65-867a-16fc-d63b-a7a1c3fdfb7b@prgmr.com>
Date: Thu, 30 Jul 2020 23:27:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727071658.GH4222@soda.linbit>
Content-Language: en-US
Subject: Re: [Drbd-dev] Bug(s) with Linux v5.4.46
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

On 7/27/20 12:16 AM, Lars Ellenberg wrote:
> On Sun, Jul 26, 2020 at 08:55:10PM -0700, Sarah Newman wrote:
> 
>> 	kref_put(&device->kref, drbd_destroy_device);
> 
> At this point we are "sure" to still hold at least one
> additional reference on device.
> 
>> 	del_gendisk(device->vdisk);
>> 	synchronize_rcu();
> 
> which we put here:
> 
>> 	kref_put(&device->kref, drbd_destroy_device);
> 
> 
> But what you present here shows that in your case that is not true.
> 

Is there a missing kref_get (and put on failure) around calling

"queue_work(connection->ack_sender, &peer_req->peer_device->send_acks_work);"

from handle_write_conflicts ?

I don't understand at all how drbd_adm_get_initial_state is supposed to work... for that reason, that's the only other place I potentially see an 
issue via code inspection.

Thanks, Sarah
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
