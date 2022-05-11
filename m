Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D06523379
	for <lists+drbd-dev@lfdr.de>; Wed, 11 May 2022 14:57:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 54DAC420620;
	Wed, 11 May 2022 14:57:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A406F420372
	for <drbd-dev@lists.linbit.com>; Wed, 11 May 2022 14:57:32 +0200 (CEST)
Received: by mail-ej1-f52.google.com with SMTP id g6so3910823ejw.1
	for <drbd-dev@lists.linbit.com>; Wed, 11 May 2022 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uEi4yzhbI7jqCjtEXz9AYoFve5a1zJAPo8B/uGqWbMk=;
	b=QaGbbub3etgXuMsMy2s9jKeAfRen6DntecD7YHDzF6RL7NaUX7QLgTvQkeazCN5vZW
	XeRjf2ty7Q1cpOzrjYOmxvTGjrkrAfxDZGoBSCN8LwT3iZosb0f0OhkGBfHg742I6oUi
	md1BkMDTWHgYwIcs5pzK6aYUxZtd+3pt6RJ+9hrIIgw89eeZ2dKKLQlkzFpunyQO1UQQ
	qNc83hAKyfXDnQ9WPLq1MZVILd5ywQAmcjllrhLrNJNgI972m34ygEW5d75eJBXIDIYZ
	3w4WKQ5UOC+sq9T7xcQ8k9+YrvZqOF3L4I+UNSQCf4+2y+Dj0RZIi4hCuF0xlMqh2muC
	JFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uEi4yzhbI7jqCjtEXz9AYoFve5a1zJAPo8B/uGqWbMk=;
	b=e05Zmyxn98USPIe/89JkENBaeGeEI4Igi5JS5bDMc1PHCls5ATY6J76F5R5OE2vtzp
	pqnXcbGOuZmw286vCKypQSJ4m6taF4lbor/v91JF/S4ZJ7uiT6zZP3jc+9WlMcHNIxkT
	MiSByOJpD8tAvAROUUdKwjIqtFoD+ZK6k5c75vTLhm81uoZ35S3cYij5EygrKK5A9VE1
	O7MEWRaSe0S0sQZFf9dlTosXWcLRu2mqrGlpq7SsuLWLI41/IPlJOK2CF91sKl1n0QZQ
	d06V6D/6MF6jiPO0aYBVpjbDvPLTUyb2h95ozAdb9+hyxuEY7l+6l+9Rgg9r3AIUO/uV
	gLzQ==
X-Gm-Message-State: AOAM532oO9xyB1faI0JLe+q7LbFLhE47WsK5+G44eC8qzqgnAYV8A+PB
	1XgPcB/ZGp2U4LJN5swgTdgf0ivF8/qxO1SNH2lcruU9RlN+DYuK
X-Google-Smtp-Source: ABdhPJzVDZ6oVbG+qF8BjS0K8R1RFB18ff5e5hZ4aBhZKp9xOYILYDmUIcV63cAk6KUrQoWPTQ/klC8amYaFZ5ojx4o=
X-Received: by 2002:a17:907:971b:b0:6f4:3b8c:ae04 with SMTP id
	jg27-20020a170907971b00b006f43b8cae04mr24652008ejc.548.1652273792030;
	Wed, 11 May 2022 05:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAGNP_+VQDpNfrDgWLDc0F1Va-Fnt5VEAFreXVn7ufiq6R_OJTQ@mail.gmail.com>
	<ABEAGAAXIWGeUYOCD1PNhaqL.3.1652248501946.Hmail.rui.xu@easystack.cn>
In-Reply-To: <ABEAGAAXIWGeUYOCD1PNhaqL.3.1652248501946.Hmail.rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Wed, 11 May 2022 14:56:20 +0200
Message-ID: <CAGNP_+WCw4+Obv_o0631Mi4Nub52O3OgHsCO_jesc-dGxBfUsQ@mail.gmail.com>
To: "rui.xu" <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] drbd: a proposal of two-primaries mode
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

Hi Xu,

The topic of active/active iSCSI targets on dual primary DRBD has been
discussed in detail before. Here are some examples:

https://lists.linbit.com/pipermail/drbd-user/2010-October/014845.html
https://lists.linbit.com/pipermail/drbd-user/2011-November/017238.html
https://lists.linbit.com/pipermail/drbd-user/2013-October/020295.html

In short, active/active iSCSI targets with dual primary DRBD is not
recommended. Unless there have been significant recent developments,
this is still the case.

The solution with iSCSI target failover via a cluster manager should
not introduce much more failover delay. You need to get the
distributed lock from your paxos system already. That is essentially
the same as what the cluster manager would do. The only additional
overhead is that you have to promote DRBD and start an iSCSI target.

You could try configuring your iSCSI initiator into a failover mode,
rather than load balancing, assuming it has such an option. Although
this is not the solution I would recommend, it is less likely to run
into problems.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
